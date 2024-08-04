import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SeminaryAndEventsScreen extends StatelessWidget {
  const SeminaryAndEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromRGBO(1, 19, 48, 1),
                Color.fromRGBO(4, 38, 92, 1),
              ],
              center: Alignment.center,
              radius: 1.0,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(title: 'Seminarios'),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Center(
                      child: Text(
                        '¡Explora un mundo de conocimientos y oportunidades con FinGlow!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        hintStyle: const TextStyle(
                          color: Colors.white54,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(76, 16, 57, 121),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(
                          Bootstrap.search,
                          color: Colors.white,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildOptionContainer(
                    icon: Bootstrap.bell,
                    title: 'Recordatorios',
                    description:
                        'Gestión de riesgos - Daniel López (zoom).\nEvento próximo en 3 días',
                  ),
                  const SizedBox(height: 20),
                  _buildOptionContainer(
                    icon: Bootstrap.calendar3,
                    title: 'Próximos seminarios',
                    description:
                        '- Planificación financiera estratégica - Óscar Díaz (Microsoft Teams).\n - Inversiones inteligentes para emprendedores - Mónica López (Google Meet).\n - Contabilidad para NO contadores - Alberto Cruz (Zoom)',
                  ),
                  const SizedBox(height: 20),
                  _buildOptionContainer(
                    icon: Bootstrap.hand_thumbs_up,
                    title: 'Próximos eventos',
                    description:
                        '- Conferencia anual de emprendedores "InnovaTech 2024" - Panel de expertos internacionales (Presencial y streaming). \n - Expo emprendedor 2024 - Variedad de líderes de startups y tecnología (Presencial) - Encuentro de Networking "Conecta y Crece" - Líderes empresariales y mentores ( Presencial).',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionContainer(
      {required IconData icon,
      required String title,
      required String description}) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: const Color.fromARGB(76, 16, 57, 121),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFF40A2F1),
          width: 2,
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF40A2F1),
            Color(0xFF103979),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 34, 221, 187),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
