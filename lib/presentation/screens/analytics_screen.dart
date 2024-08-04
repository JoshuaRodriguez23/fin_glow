import 'package:flutter/material.dart';
import './weekly_screen.dart';
import '../widgets/oval_navbar.dart';
import '../widgets/custom_app_bar.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  AnalyticsScreenState createState() => AnalyticsScreenState();
}

class AnalyticsScreenState extends State<AnalyticsScreen> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const WeeklyView(),
    const WeeklyView(),
    const WeeklyView(),
  ];

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
          child: SafeArea(
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Panel financiero',
                ),
                const SizedBox(height: 20),
                OvalNavbar(
                  options: const ['Semanal', 'Mensual', 'Anual'],
                  onOptionSelected: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: _views[_currentIndex],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
