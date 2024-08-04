import 'package:flutter/material.dart';

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
          child: const SafeArea(
            child: Center(
              child: Text(
                'Seminarios',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24), // Puedes personalizar el estilo
              ),
            ),
          ),
        ),
      ),
    );
  }
}
