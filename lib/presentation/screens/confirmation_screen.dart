import 'package:fin_glow/presentation/screens/transfers_success_screen.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String name;
  final String accountNumber;
  final double amount;

  const ConfirmationScreen({
    super.key,
    required this.name,
    required this.accountNumber,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    String initials = name.isNotEmpty ? name[0].toUpperCase() : '';

    return Scaffold(
      body: Container(
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
              const CustomAppBar(title: 'Confirmación de Transferencia'),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(140, 255, 255, 255),
                        ),
                        child: Center(
                          child: Text(
                            initials,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'Montserrrat',
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        accountNumber,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(139, 255, 255, 255),
                            fontFamily: 'Montserrrat'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          '\$${amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Montserrat'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/virtual_card_basic.png',
                      width: 500,
                      height: 200,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransferSuccessScreen(
                                name: name,
                                accountNumber: accountNumber,
                                amount: amount,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 89, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Transferir',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
