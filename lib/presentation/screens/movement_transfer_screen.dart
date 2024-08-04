import 'package:fin_glow/presentation/screens/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';

class AccountDetailScreen extends StatefulWidget {
  final String name;
  final String accountNumber;

  const AccountDetailScreen(
      {super.key, required this.name, required this.accountNumber});

  @override
  AccountDetailScreenState createState() => AccountDetailScreenState();
}

class AccountDetailScreenState extends State<AccountDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _decimalController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  double _textSize = 48;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    _decimalController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    // Obtiene la cantidad ingresada y verifica si es diferente de cero
    String amountText = _textController.text.replaceAll(',', '');
    String decimalText = _decimalController.text;
    double amount = double.tryParse(amountText) ?? 0;

    if (amount > 0) {
      // Avanza a la siguiente vista con la cantidad y el nombre
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmationScreen(
            name: widget.name,
            accountNumber: widget.accountNumber,
            amount: amount +
                (decimalText.isNotEmpty ? double.parse('0.$decimalText') : 0),
          ),
        ),
      );
    } else {
      // Mostrar un mensaje de error (opcional)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingrese una cantidad válida.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String initials =
        widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: '¿Cuánto dinero quieres transferir?'),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
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
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: FadeTransition(
                  opacity: _animation,
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: _textSize),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(7),
                              CurrencyTextInputFormatter(
                                  onTextSizeChanged: (newSize) {
                                setState(() {
                                  _textSize = newSize;
                                });
                              }),
                            ],
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              prefixStyle:
                                  TextStyle(color: Colors.white, fontSize: 48),
                              hintText: '0',
                              hintStyle: TextStyle(
                                  color: Colors.white54, fontSize: 48),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          child: TextField(
                            controller: _decimalController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                            ],
                            decoration: const InputDecoration(
                              hintText: '00',
                              hintStyle: TextStyle(
                                  color: Colors.white54, fontSize: 24),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Motivo:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Colors.white.withOpacity(0.1), // Fondo del input
                          borderRadius:
                              BorderRadius.circular(8), // Esquinas redondeadas
                        ),
                        child: TextField(
                          controller: _reasonController,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                          decoration: const InputDecoration(
                            hintText: 'Escribe el motivo aquí',
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 15),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 120, // Ancho del botón
                      height: 50, // Altura del botón
                      child: ElevatedButton(
                        onPressed: _onContinuePressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 89, 89),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Continuar',
                          style: TextStyle(color: Colors.white, fontSize: 12),
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
    );
  }
}

class CurrencyTextInputFormatter extends TextInputFormatter {
  final Function(double) onTextSizeChanged;

  CurrencyTextInputFormatter({required this.onTextSizeChanged});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      onTextSizeChanged(48);
      return newValue;
    }

    final newText = newValue.text.replaceAll(',', '');
    if (newText.length > 6) {
      return oldValue;
    }

    final number = int.tryParse(newText);
    final formattedText = number != null ? _formatWithCommas(number) : newText;

    double textSize = 48 - (newText.length * 4);
    onTextSizeChanged(textSize.clamp(15, 30));

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatWithCommas(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }
}
