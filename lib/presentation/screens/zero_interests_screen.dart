import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ZeroInterestsScreen extends StatelessWidget {
  ZeroInterestsScreen({super.key});

  final List<Map<String, dynamic>> services = [
    {
      'text': '10% de descuento',
      'icon': Bootstrap.youtube,
    },
    {
      'text': '5% de descuento',
      'icon': Bootstrap.amazon,
    },
  ];

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
            child: Center(
              child: Wrap(
                spacing: 50,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: services.map((service) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 120,
                      height: 120,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                service['icon'],
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              service['text'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
