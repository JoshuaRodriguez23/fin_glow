import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:icons_plus/icons_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SeeAllScreen(),
    );
  }
}

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double amazonAmount = 1230.60;
    const double mcdonaldsAmount = 2320.90;
    const double appleAmount = 12000.00;
    const double homeDepotAmount = 5000.10;

    const double totalAmount =
        amazonAmount + mcdonaldsAmount + appleAmount + homeDepotAmount;

    const double amazonPercentage = (amazonAmount / totalAmount) * 100;
    const double mcdonaldsPercentage = (mcdonaldsAmount / totalAmount) * 100;
    const double applePercentage = (appleAmount / totalAmount) * 100;
    const double homeDepotPercentage = (homeDepotAmount / totalAmount) * 100;

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
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Historial',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 2.0,
                    child: Stack(
                      children: [
                        PieChart(
                          PieChartData(
                            centerSpaceRadius: 70,
                            sections: [
                              PieChartSectionData(
                                color: Colors.red,
                                value: amazonPercentage,
                                radius: 40,
                                badgeWidget:
                                    const _BadgeWidget(icon: Bootstrap.amazon),
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: Colors.orange,
                                value: mcdonaldsPercentage,
                                radius: 40,
                                badgeWidget: const _BadgeWidget(
                                    icon: LineAwesome.microchip_solid),
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: Colors.green,
                                value: applePercentage,
                                radius: 40,
                                badgeWidget:
                                    const _BadgeWidget(icon: Bootstrap.apple),
                                showTitle: false,
                              ),
                              PieChartSectionData(
                                color: Colors.purple,
                                value: homeDepotPercentage,
                                radius: 40,
                                badgeWidget: const _BadgeWidget(
                                    icon: Bootstrap.airplane_engines),
                                showTitle: false,
                              ),
                            ],
                          ),
                        ),
                        const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$$totalAmount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Balance de gastos',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Raleway'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Expanded(
                  child: ListView(
                    children: const [
                      ExpenseItem(
                        icon: Bootstrap.amazon,
                        title: "Amazon",
                        date: "Abril 17, 2023",
                        amount: amazonAmount,
                      ),
                      ExpenseItem(
                        icon: LineAwesome.microchip_solid,
                        title: "McDonalds",
                        date: "Marzo 29, 2023",
                        amount: mcdonaldsAmount,
                      ),
                      ExpenseItem(
                        icon: Bootstrap.apple,
                        title: "Apple",
                        date: "Marzo 10, 2023",
                        amount: appleAmount,
                      ),
                      ExpenseItem(
                        icon: Bootstrap.airplane_engines,
                        title: "Home Depot",
                        date: "Febrero 25, 2023",
                        amount: homeDepotAmount,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ver más',
                          style: TextStyle(
                            color: Color.fromRGBO(64, 162, 241, 1),
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 5),
                        Icon(
                          Bootstrap.chevron_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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

class ExpenseItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final double amount;

  const ExpenseItem({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(154, 10, 89, 89),
        borderRadius: BorderRadius.circular(28),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 64, 161, 241),
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: Text(
          '-\$${amount.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
