import 'package:fin_glow/domain/models/seminary_model.dart';
import 'package:fin_glow/domain/repositories/seminary_data_repository.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:logger/logger.dart';

class SeminaryAndEventsScreen extends StatefulWidget {
  const SeminaryAndEventsScreen({super.key});

  @override
  SeminaryAndEventsScreenState createState() => SeminaryAndEventsScreenState();
}

class SeminaryAndEventsScreenState extends State<SeminaryAndEventsScreen> {
  late Future<List<Event>> futureEvents;
  final Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    futureEvents = EventRepository().fetchEvents();
  }

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
                mainAxisSize: MainAxisSize.min,
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
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<List<Event>>(
                    future: futureEvents,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        logger.e(
                            'Error al cargar los eventos: ${snapshot.error}');
                        return Text(
                            'Error al cargar los eventos: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No hay eventos disponibles');
                      }

                      final events = snapshot.data!;
                      return Column(
                        children: events.map((event) {
                          return Column(
                            children: [
                              _buildOptionContainer(
                                icon: _getIconData(event.icon),
                                title: event.title,
                                description: event.description,
                              ),
                              const SizedBox(height: 40)
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'Bootstrap.bell':
        return Bootstrap.bell;
      case 'Bootstrap.calendar3':
        return Bootstrap.calendar3;
      case 'Bootstrap.hand_thumbs_up':
        return Bootstrap.hand_thumbs_up;
      default:
        return Icons.error; // Icono por defecto
    }
  }

  Widget _buildOptionContainer({
    required IconData icon,
    required String title,
    required String description,
  }) {
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
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
