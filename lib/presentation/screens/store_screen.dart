import 'package:fin_glow/presentation/bloc/bloc/store_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/store_event.dart';
import 'package:fin_glow/presentation/bloc/state/store_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'promotions_screen.dart';
import 'zero_interests_screen.dart';
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
  late List<Widget> _views;

  @override
  void initState() {
    super.initState();
    final storeBloc = context.read<StoreBloc>();
    storeBloc.add(FetchStoreData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      builder: (context, state) {
        if (state is StoreLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StoreError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is StoreLoaded) {
          final storeData = state.storeData;

          _views = [
            PromotionsScreen(),
            ZeroInterestsScreen(),
            PromotionsScreen(),
          ];

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
                    // Habilitar desplazamiento
                    child: Column(
                      children: [
                        CustomAppBar(title: storeData.title),
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
                              items: storeData.promotions.map((promotion) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, promotion.route);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      constraints: const BoxConstraints(
                                          maxWidth: 300, maxHeight: 100),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            76, 16, 57, 121),
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
                                          promotion.image,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 200,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  storeData.promotions.length, (index) {
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    storeData.promotionsTitle,
                                    style: const TextStyle(
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
                              options: storeData.navbarOptions,
                              onOptionSelected: (index) {
                                setState(() {
                                  _currentIndex2 = index;
                                });
                              },
                            ),
                            const SizedBox(height: 40),
                            // Usar Expanded para que PromotionsScreen ocupe el espacio restante
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
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
        return Container(); // Retorno por defecto
      },
    );
  }
}
