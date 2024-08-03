import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:icons_plus/icons_plus.dart';

class ExpensePieChart extends StatelessWidget {
  final double amazonPercentage;
  final double mcdonaldsPercentage;
  final double applePercentage;
  final double homeDepotPercentage;

  const ExpensePieChart({
    required this.amazonPercentage,
    required this.mcdonaldsPercentage,
    required this.applePercentage,
    required this.homeDepotPercentage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 70,
        sections: [
          PieChartSectionData(
            color: Colors.red,
            value: amazonPercentage,
            radius: 40,
            badgeWidget: const _BadgeWidget(icon: Bootstrap.amazon),
            showTitle: false,
          ),
          PieChartSectionData(
            color: Colors.orange,
            value: mcdonaldsPercentage,
            radius: 40,
            badgeWidget: const _BadgeWidget(icon: LineAwesome.microchip_solid),
            showTitle: false,
          ),
          PieChartSectionData(
            color: Colors.green,
            value: applePercentage,
            radius: 40,
            badgeWidget: const _BadgeWidget(icon: Bootstrap.apple),
            showTitle: false,
          ),
          PieChartSectionData(
            color: Colors.purple,
            value: homeDepotPercentage,
            radius: 40,
            badgeWidget: const _BadgeWidget(icon: Bootstrap.airplane_engines),
            showTitle: false,
          ),
        ],
      ),
    );
  }
}

class _BadgeWidget extends StatelessWidget {
  final IconData icon;

  const _BadgeWidget({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon, size: 18, color: Colors.black),
    );
  }
}
