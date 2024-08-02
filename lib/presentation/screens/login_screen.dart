import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_button.dart';
import '../widgets/divider_text.dart';
import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Bienvenido a FinGlow!',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const CustomText(
                          text: 'Tu éxito financiero comienza hoy.',
                          size: 15,
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/logo_vertical.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        const CustomTextField(
                          label: 'Teléfono',
                        ),
                        const SizedBox(height: 20),
                        const CustomTextField(
                          label: 'Contraseña',
                          obscureText: true,
                        ),
                        const SizedBox(height: 30),
                        const LoginButton(),
                        const SizedBox(height: 20),
                        const CustomText(
                          text: 'Recuperar Contraseña',
                          size: 12,
                        ),
                        const SizedBox(height: 20),
                        const DividerText(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(
                              text: '¿Quieres usar la app de FinGlow?',
                              size: 12,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text(
                                'Abrir cuenta',
                                style: TextStyle(
                                  color: Color.fromRGBO(34, 221, 187, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.fingerprint,
                          color: Colors.white,
                          size: 45,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
