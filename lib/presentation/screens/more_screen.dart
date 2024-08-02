import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

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
                'Contenido de la pantalla de Más',
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
