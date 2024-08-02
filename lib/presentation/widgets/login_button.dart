import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(10, 89, 89, 1),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text('Entrar'),
    );
  }
}
