import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './promotions_screen.dart';
import './zero_interests_screen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/oval_navbar.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  StoreScreenState createState() => StoreScreenState();
}

class StoreScreenState extends State<StoreScreen> {
  int _currentIndex = 0;
  int _currentIndex2 = 0;

  final List<Widget> _views = [
    PromotionsScreen(),
    ZeroInterestsScreen(),
    PromotionsScreen(),
  ];

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
              // Agregado para habilitar el scroll
              child: Column(
                children: [
                  const CustomAppBar(title: 'Marketplace empresarial'),
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        items: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cardDetails');
                              },
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                    maxWidth: 300, maxHeight: 100),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Image.asset(
                                    'assets/images/image_publicidad.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cardDetails');
                              },
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                    maxWidth: 300, maxHeight: 100),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Image.asset(
                                    'assets/images/image_publicidad2.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/cardDetails');
                              },
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                    maxWidth: 300, maxHeight: 100),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: Image.asset(
                                    'assets/images/image_publicidad3.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? const Color(0xFF40A2F1)
                                  : const Color(0xFFD3D3D3),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Descubre nuestras promociones',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      OvalNavbar(
                        options: const [
                          'Todas',
                          'Meses sin intereses',
                          'Descuentos'
                        ],
                        onOptionSelected: (index) {
                          setState(() {
                            _currentIndex2 = index;
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      // Asegúrate de que la vista de promociones sea desplazable
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.5, // Ajusta la altura
                        child: _views[_currentIndex2],
                      ),
                    ],
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
