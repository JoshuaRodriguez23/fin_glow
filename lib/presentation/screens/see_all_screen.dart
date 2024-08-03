import 'dart:convert';
import 'package:fin_glow/presentation/screens/details_movement_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/pie_chart.dart';

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

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  SeeAllScreenState createState() => SeeAllScreenState();
}

class SeeAllScreenState extends State<SeeAllScreen> {
  List<Map<String, dynamic>> movements = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/json/movements.json');
    final data = await json.decode(response) as List;
    setState(() {
      movements = data.map((e) => e as Map<String, dynamic>).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double totalAmount =
        movements.fold(0.0, (sum, item) => sum + (item['amount'] as double));

    final List<double> percentages = totalAmount > 0
        ? movements
            .map((item) => (item['amount'] as double) / totalAmount * 100)
            .toList()
        : [];

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
                  title: 'Historial',
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 2.0,
                    child: Stack(
                      children: [
                        ExpensePieChart(
                          amazonPercentage:
                              percentages.isNotEmpty ? percentages[0] : 0.0,
                          mcdonaldsPercentage:
                              percentages.length > 1 ? percentages[1] : 0.0,
                          applePercentage:
                              percentages.length > 2 ? percentages[2] : 0.0,
                          homeDepotPercentage:
                              percentages.length > 3 ? percentages[3] : 0.0,
                        ),
                        Center(
                          child: ExpenseTotalAmount(totalAmount: totalAmount),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Expanded(
                  child: ExpenseList(
                    items: movements.map((movement) {
                      return ExpenseItemData(
                        icon: getIconForTitle(movement['title'] as String),
                        title: movement['title'] as String,
                        date: movement['date'] as String,
                        amount: movement['amount'] as double,
                      );
                    }).toList(),
                  ),
                ),
                const ViewMoreButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData getIconForTitle(String title) {
    switch (title) {
      case 'Amazon':
        return Bootstrap.cart;
      case 'McDonald\'s':
        return Bootstrap.cup_straw;
      case 'Apple':
        return Bootstrap.phone;
      case 'Home Depot':
        return Bootstrap.house_door;
      case 'Starbucks':
        return Bootstrap.cup_hot;
      case 'Netflix':
        return Bootstrap.film;
      case 'Spotify':
        return Bootstrap.music_note;
      case 'Uber':
        return Bootstrap.car_front;
      case 'Walmart':
        return Bootstrap.cart4;
      case 'Subway':
        return Bootstrap.shop;
      case 'Best Buy':
        return Bootstrap.tv;
      case 'Target':
        return Bootstrap.basket;
      case 'Nike':
        return Bootstrap.shop;
      case 'Adidas':
        return Bootstrap.suit_heart;
      case 'Grocery Store':
        return Bootstrap.basket3;
      case 'Gas Station':
        return Bootstrap.fuel_pump;
      case 'Gym':
        return Bootstrap.heart;
      case 'Pharmacy':
        return Bootstrap.capsule;
      case 'Book Store':
        return Bootstrap.book;
      case 'Electronics':
        return Bootstrap.laptop;
      default:
        return Bootstrap.question;
    }
  }
}

class ExpenseTotalAmount extends StatelessWidget {
  final double totalAmount;

  const ExpenseTotalAmount({required this.totalAmount, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$$totalAmount',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Balance de gastos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Raleway',
          ),
        ),
      ],
    );
  }
}

class ExpenseList extends StatelessWidget {
  final List<ExpenseItemData> items;

  const ExpenseList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ExpenseItem(data: items[index]);
      },
    );
  }
}

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/seeMore');
        },
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
    );
  }
}

class ExpenseItemData {
  final IconData icon;
  final String title;
  final String date;
  final double amount;

  ExpenseItemData({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
  });
}

class ExpenseItem extends StatelessWidget {
  final ExpenseItemData data;

  const ExpenseItem({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpenseDetailScreen(data: data),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(154, 10, 89, 89),
          borderRadius: BorderRadius.circular(28),
        ),
        child: ListTile(
          leading: Icon(data.icon, size: 40.0),
          title: Text(
            data.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 64, 161, 241),
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            data.date,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: Text(
            '-\$${data.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
