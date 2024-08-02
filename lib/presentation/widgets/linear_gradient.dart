import 'package:flutter/material.dart';

class LinearGradientIndicator extends StatelessWidget {
  final double value;

  const LinearGradientIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(16, 57, 121, 50),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          FractionallySizedBox(
            widthFactor: value,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF40A2F1),
                    Color(0xFF2DA690),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
