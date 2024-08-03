import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:fin_glow/presentation/widgets/icon_container.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key});

  @override
  CardDetailsScreenState createState() => CardDetailsScreenState();
}

class CardDetailsScreenState extends State<CardDetailsScreen> {
  List<Map<String, dynamic>> movements = [];

  Future<void> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/json/movements.json');
    final data = await json.decode(response) as List;
    setState(() {
      movements = data.map((e) => e as Map<String, dynamic>).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'Detalle de movimiento',
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                                maxWidth: 600, maxHeight: 200),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(76, 16, 57, 121),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: const Color(0xFF40A2F1),
                                width: 2,
                              ),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF40A2F1),
                                  Color(0xFF103979),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/virtual_card_basic.png',
                                width: 500,
                                height: 500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconContainer(
                                imagePath: 'assets/images/key_icon.png',
                                label: 'Consultar\n NIP',
                              ),
                              IconContainer(
                                  imagePath: 'assets/images/power_icon.png',
                                  label: 'Apagar \n tarjeta'),
                              IconContainer(
                                  imagePath: 'assets/images/gear_icon.png',
                                  label: 'Configurar \ntarjeta'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Últimos movimientos:',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/seeAll');
                                  },
                                  child: const Text(
                                    'Ver todos',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color.fromRGBO(34, 221, 187, 1),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(76, 16, 57, 121),
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(
                                color: const Color(0xFF40A2F1),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: movements.length > 5
                                      ? 5
                                      : movements.length,
                                  itemBuilder: (context, index) {
                                    final movement = movements[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                movement['title']!,
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF40A2F1),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                '\$${movement['amount'].toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Text(
                                            movement['date']!,
                                            style: const TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const Divider(color: Colors.white),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
