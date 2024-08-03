import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'shiny_icon.dart';

class CurvedNavigationBar extends StatelessWidget {
  final Function(int) onItemTapped;

  const CurvedNavigationBar({required this.onItemTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 8, 61, 104),
            Color.fromARGB(255, 16, 57, 121),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: ConvexAppBar(
        items: const [
          TabItem(
            icon: ShinyIcon(icon: Icons.home_outlined, color: Colors.white),
            title: 'Inicio',
          ),
          TabItem(
            icon:
                ShinyIcon(icon: Icons.bar_chart_outlined, color: Colors.white),
            title: 'Estadísticas',
          ),
          TabItem(
            icon: ShinyIcon(icon: Icons.store_outlined, color: Colors.white),
            title: 'Tienda',
          ),
          TabItem(
            icon:
                ShinyIcon(icon: Icons.more_horiz_outlined, color: Colors.white),
            title: 'Más',
          ),
        ],
        initialActiveIndex: 0,
        onTap: onItemTapped,
        backgroundColor: Colors.transparent,
        activeColor: const Color.fromARGB(216, 0, 115, 209),
        height: 60,
      ),
    );
  }
}
