import 'package:fin_glow/domain/models/weekly_model.dart';
import 'package:fin_glow/domain/repositories/weekly_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:fl_chart/fl_chart.dart' as fl_chart;

class WeeklyView extends StatefulWidget {
  const WeeklyView({super.key});

  @override
  WeeklyViewState createState() => WeeklyViewState();
}

class WeeklyViewState extends State<WeeklyView> {
  late Future<WeeklyViewData> weeklyViewData;

  @override
  void initState() {
    super.initState();
    weeklyViewData = WeeklyViewRepository().fetchWeeklyViewData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeeklyViewData>(
      future: weeklyViewData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final data = snapshot.data!;

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
                    'Monthly Summary',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
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
                  child: fl_chart.BarChart(
                    fl_chart.BarChartData(
                      alignment: fl_chart.BarChartAlignment.spaceAround,
                      maxY: 100,
                      barTouchData: fl_chart.BarTouchData(enabled: false),
                      titlesData: fl_chart.FlTitlesData(
                        leftTitles: const fl_chart.AxisTitles(
                          sideTitles: fl_chart.SideTitles(showTitles: false),
                        ),
                        rightTitles: const fl_chart.AxisTitles(
                          sideTitles: fl_chart.SideTitles(showTitles: false),
                        ),
                        topTitles: const fl_chart.AxisTitles(
                          sideTitles: fl_chart.SideTitles(showTitles: false),
                        ),
                        bottomTitles: fl_chart.AxisTitles(
                          sideTitles: fl_chart.SideTitles(
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
                      gridData: const fl_chart.FlGridData(show: false),
                      borderData: fl_chart.FlBorderData(show: false),
                      barGroups: data.barChartData
                          .asMap()
                          .entries
                          .map(
                            (entry) => fl_chart.BarChartGroupData(
                              x: entry.key,
                              barRods: [
                                fl_chart.BarChartRodData(
                                  toY: entry.value.income
                                      .toDouble(), // Convierte a double
                                  color: Colors.lightBlueAccent,
                                  width: 10,
                                ),
                                fl_chart.BarChartRodData(
                                  toY: entry.value.expenses
                                      .toDouble(), // Convierte a double
                                  color: Colors.lightGreenAccent,
                                  width: 10,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
