import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewAccountScreen extends StatefulWidget {
  final Function(String, String) onSave;

  const NewAccountScreen({super.key, required this.onSave});

  @override
  AccountNumberInputScreenState createState() =>
      AccountNumberInputScreenState();
}

class AccountNumberInputScreenState extends State<NewAccountScreen> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _submit() {
    final accountNumber = _accountNumberController.text.replaceAll(' ', '');
    final name = _nameController.text;

    if (accountNumber.length == 16) {
      widget.onSave(name, accountNumber);
      Navigator.pop(context);
    } else {
      // Mostrar un mensaje de error si el número de cuenta no es válido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('El número de cuenta debe tener 16 dígitos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
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
                    children: [
                      TextField(
                        controller: _accountNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Número de Cuenta',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(
                              16), // Limitar a 16 dígitos
                          AccountNumberInputFormatter(
                              context), // Formatear con espacios
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF40A2F1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(color: Colors.white),
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

class AccountNumberInputFormatter extends TextInputFormatter {
  final BuildContext context; // Agregamos el contexto

  AccountNumberInputFormatter(this.context); // Constructor

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Solo permitir números y espacios
    if (newValue.text.isEmpty) {
      return TextEditingValue.empty;
    }

    // Eliminar cualquier carácter que no sea dígito
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Formatear el número en grupos de 4 dígitos separados por un espacio
    StringBuffer formatted = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted.write(' ');
      }
      formatted.write(digits[i]);
    }

    // Si ya tiene 16 caracteres, ocultar el teclado
    if (formatted.toString().length >= 20) {
      FocusScope.of(context).unfocus(); // Cierra el teclado
    }

    return TextEditingValue(
      text: formatted.toString(),
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
