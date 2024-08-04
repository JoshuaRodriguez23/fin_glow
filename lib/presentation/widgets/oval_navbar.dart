import 'package:flutter/material.dart';

class OvalNavbar extends StatefulWidget {
  final List<String> options;
  final ValueChanged<int> onOptionSelected;

  const OvalNavbar({
    super.key,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  OvalNavbarState createState() => OvalNavbarState();
}

class OvalNavbarState extends State<OvalNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final optionWidth = (screenWidth - 32) / widget.options.length - 8;

    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 4, 38, 96),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment(
                    -1 + 2 * (_selectedIndex / (widget.options.length - 1)), 0),
                child: Container(
                  width: optionWidth,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(122, 45, 166, 144),
                        Color.fromARGB(163, 64, 161, 241)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(widget.options.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onOptionSelected(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: optionWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.options[index],
                      style: TextStyle(
                        color: _selectedIndex == index
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(137, 255, 255, 255),
                        fontWeight: _selectedIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
