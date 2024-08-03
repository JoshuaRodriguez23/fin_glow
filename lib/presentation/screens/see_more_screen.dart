import 'dart:convert';
import 'package:fin_glow/presentation/screens/see_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:logger/logger.dart';
import '../widgets/custom_app_bar.dart';

class ViewMoreScreen extends StatefulWidget {
  const ViewMoreScreen({super.key});

  @override
  ViewMoreScreenState createState() => ViewMoreScreenState();
}

class ViewMoreScreenState extends State<ViewMoreScreen> {
  final Logger logger = Logger();
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
                  title: 'Movimientos Detallados',
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: movements.length,
                    itemBuilder: (context, index) {
                      return ExpenseItem(
                        data: ExpenseItemData(
                          icon: getIconForTitle(
                              movements[index]['title'] as String),
                          title: movements[index]['title'] as String,
                          date: movements[index]['date'] as String,
                          amount: movements[index]['amount'] as double,
                        ),
                      );
                    },
                  ),
                ),
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
