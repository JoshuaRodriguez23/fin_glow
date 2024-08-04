import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FinancialAdvisorScreen extends StatelessWidget {
  const FinancialAdvisorScreen({super.key});

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
            child: Column(
              children: [
                const CustomAppBar(title: 'Asesor financiero'),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '¿Cómo deseas conversar?',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          _buildOptionContainer(
                            icon: Bootstrap.chat,
                            title: 'Chat en tiempo real',
                            subtitle:
                                'Te damos las respuestas rápidas\n a preguntas comunes.',
                          ),
                          const SizedBox(height: 20),
                          _buildOptionContainer(
                            icon: Bootstrap.whatsapp,
                            title: 'Chat en Whatsapp',
                            subtitle:
                                'Te enviaremos un mensaje en menos\n de 10 minutos.',
                          ),
                          const SizedBox(height: 20),
                          _buildOptionContainer(
                            icon: Bootstrap.telephone,
                            title: 'Llamada telefónica',
                            subtitle: 'Te llamaremos en menos de 10 minutos.',
                          ),
                          const SizedBox(height: 20),
                          _buildOptionContainer(
                            icon: Bootstrap.envelope,
                            title: 'Formulario electrónico',
                            subtitle: 'Te responderemos por e-mail.',
                          ),
                          const SizedBox(height: 20),
                          _buildOptionContainer(
                            icon: Bootstrap.camera_video,
                            title: 'Videollamada LSM',
                            subtitle:
                                'Te ayudaremos a programar una reunión\n con un interprete.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionContainer(
      {required IconData icon,
      required String title,
      required String subtitle,
      Color iconColor = Colors.white}) {
    return Container(
      width: 350,
      height: 100,
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(icon, color: iconColor)
                ], // Cambia el color aquí
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
