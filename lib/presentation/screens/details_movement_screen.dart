import 'package:fin_glow/presentation/screens/see_all_screen.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ExpenseDetailScreen extends StatelessWidget {
  final ExpenseItemData data;

  const ExpenseDetailScreen({required this.data, super.key});

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
                  title: 'Detalle de movimiento',
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                              maxWidth: 300, maxHeight: 200),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data.reference,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                ' -\$${data.amount.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                ' Pago',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                data.reference,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Categoría',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                              maxWidth: 300, maxHeight: 100),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(76, 16, 57, 121),
                            borderRadius: BorderRadius.circular(20),
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      data.reference,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
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
    );
  }
}
