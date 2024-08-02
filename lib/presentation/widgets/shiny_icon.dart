import 'package:flutter/material.dart';

class ShinyIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const ShinyIcon({
    super.key,
    required this.icon,
    required this.color,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 100,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
