import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  bool _acceptedTerms = false; //

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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.chevron_left, color: Colors.white),
                                SizedBox(width: 5),
                                Text(
                                  'Volver',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '¡Sé parte de FinGlow!',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Regístrate y da el primer paso hacia tu libertad financiera.',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/logo_vertical.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0), // Margen a la izquierda
                          child: Align(
                            alignment: Alignment
                                .centerLeft, // Alineando a la izquierda
                            child: Text(
                              'IDENTIFÍCATE',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20.0), // Margen a la izquierda
                          child: Align(
                            alignment: Alignment
                                .centerLeft, // Alineando a la izquierda
                            child: Text(
                              'Ingresa los siguientes datos para iniciar el proceso de registro.',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const CustomTextField(label: 'Nombre'),
                        const SizedBox(height: 20),
                        const CustomTextField(label: 'Apellidos'),
                        const SizedBox(height: 20),
                        const CustomTextField(label: 'Correo electrónico'),
                        const SizedBox(height: 20),
                        const CustomTextField(label: 'RFC'),
                        const SizedBox(height: 20),
                        const CustomTextField(label: 'Número de teléfono'),
                        const SizedBox(height: 20),
                        const CustomTextField(
                            label: 'Contraseña', obscureText: true),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Checkbox(
                              value: _acceptedTerms,
                              onChanged: (bool? value) {
                                setState(() {
                                  _acceptedTerms = value ?? false;
                                });
                              },
                            ),
                            const Expanded(
                              child: CustomText(
                                text: 'Acepto los Términos y Condiciones',
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _acceptedTerms
                              ? () {
                                  // Acción cuando se presiona el botón Continuar
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(10, 89, 89, 1),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 150, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Continuar'),
                        ),
                        const SizedBox(height: 30),
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
