import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String imagePath;
  final String label;
  final double width;
  final double height;

  const IconContainer({
    super.key,
    required this.imagePath,
    required this.label,
    this.width = 80,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
          Image.asset(imagePath, width: width * 0.5, height: height * 0.5),
          const SizedBox(height: 5),
          Center(
            // Agrega el widget Center aquí
            child: Text(
              label,
              textAlign: TextAlign.center, // Asegura que el texto esté centrado
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
