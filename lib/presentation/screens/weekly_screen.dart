import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:fin_glow/domain/models/weekly_model.dart';

class WeeklyView extends StatelessWidget {
  final WeeklyViewData data;

  const WeeklyView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Bootstrap.calendar3, color: Colors.white),
              const SizedBox(width: 5),
              Text(
                data.title,
                style: const TextStyle(color: Colors.white),
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
                  Text(
                    '\$${data.incomeAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
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
                  Text(
                    '\$${data.expensesAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
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
              child: fl.BarChart(
                fl.BarChartData(
                  alignment: fl.BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: fl.BarTouchData(enabled: false),
                  titlesData: fl.FlTitlesData(
                    leftTitles: const fl.AxisTitles(
                      sideTitles: fl.SideTitles(showTitles: false),
                    ),
                    rightTitles: const fl.AxisTitles(
                      sideTitles: fl.SideTitles(showTitles: false),
                    ),
                    topTitles: const fl.AxisTitles(
                      sideTitles: fl.SideTitles(showTitles: false),
                    ),
                    bottomTitles: fl.AxisTitles(
                      sideTitles: fl.SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          );
                          final index = value.toInt();
                          if (index >= 0 && index < data.barChartData.length) {
                            return Text(data.barChartData[index].month,
                                style: style);
                          }
                          return const Text('', style: style);
                        },
                      ),
                    ),
                  ),
                  gridData: const fl.FlGridData(show: false),
                  borderData: fl.FlBorderData(show: false),
                  barGroups: data.barChartData.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    return fl.BarChartGroupData(
                      x: index,
                      barRods: [
                        fl.BarChartRodData(
                          toY: item.income,
                          color: Colors.lightBlueAccent,
                          width: 10,
                        ),
                        fl.BarChartRodData(
                          toY: item.expenses,
                          color: Colors.lightGreenAccent,
                          width: 10,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
