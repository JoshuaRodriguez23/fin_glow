import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.label,
    this.obscureText = false,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus || _controller.text.isNotEmpty;
        });
      },
      child: TextField(
        controller: _controller,
        style: const TextStyle(
          fontSize: 14, // Establecer el tamaño del texto aquí
          color: Colors.white, // Color del texto
        ),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            fontSize: 13,
            color: _isFocused || _controller.text.isNotEmpty
                ? Colors.white
                : Colors.white54,
          ),
          filled: true,
          fillColor: const Color.fromARGB(105, 4, 38, 92),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(34, 221, 187, 1)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(34, 221, 187, 0.378)),
          ),
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
