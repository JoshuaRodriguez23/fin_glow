import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyView extends StatelessWidget {
  const WeeklyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Bootstrap.calendar3, color: Colors.white),
              SizedBox(width: 5),
              Text(
                'Dic 2023',
                style: TextStyle(color: Colors.white),
              ),
              Icon(Bootstrap.dash, color: Colors.white),
              SizedBox(width: 5),
              Icon(Bootstrap.calendar3, color: Colors.white),
              SizedBox(width: 5),
              Text(
                'Abril 2024',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.lightBlueAccent,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Ingresos',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '\$80,200.00',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: Colors.lightGreenAccent,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Egresos',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '\$35,229.00',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Dic', style: style);
                            case 1:
                              return const Text('Ene', style: style);
                            case 2:
                              return const Text('Feb', style: style);
                            case 3:
                              return const Text('Mar', style: style);
                            case 4:
                              return const Text('Abr', style: style);
                            default:
                              return const Text('', style: style);
                          }
                        },
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 80,
                          color: Colors.lightBlueAccent,
                          width: 10,
                        ),
                        BarChartRodData(
                          toY: 35,
                          color: Colors.lightGreenAccent,
                          width: 10,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 70,
                          color: Colors.lightBlueAccent,
                          width: 10,
                        ),
                        BarChartRodData(
                          toY: 30,
                          color: Colors.lightGreenAccent,
                          width: 10,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 60,
                          color: Colors.lightBlueAccent,
                          width: 10,
                        ),
                        BarChartRodData(
                          toY: 40,
                          color: Colors.lightGreenAccent,
                          width: 10,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 90,
                          color: Colors.lightBlueAccent,
                          width: 10,
                        ),
                        BarChartRodData(
                          toY: 50,
                          color: Colors.lightGreenAccent,
                          width: 10,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(
                          toY: 85,
                          color: Colors.lightBlueAccent,
                          width: 10,
                        ),
                        BarChartRodData(
                          toY: 45,
                          color: Colors.lightGreenAccent,
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
