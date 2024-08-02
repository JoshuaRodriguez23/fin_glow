import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/profile_picture.dart';
import '../screens/analytics_screen.dart';
import '../screens/store_screen.dart';
import '../screens/more_screen.dart';
import '../widgets/custom_text.dart';
import '../widgets/linear_gradient.dart';
import '../widgets/icon_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final double totalAmount = 20000;
  final double availableAmount = 10000;

  final List<Map<String, String>> movements = [
    {
      'title': 'Depósito',
      'amount': '\$500.00',
      'date': '01/08/2024',
    },
    {
      'title': 'Transferencia',
      'amount': '\$200.00',
      'date': '31/07/2024',
    },
    {
      'title': 'Pago de servicio',
      'amount': '\$300.00',
      'date': '30/07/2024',
    },
    {
      'title': 'Retiro',
      'amount': '\$150.00',
      'date': '29/07/2024',
    },
    {
      'title': 'Compra en tienda',
      'amount': '\$80.00',
      'date': '28/07/2024',
    },
    {
      'title': 'Suscripción mensual',
      'amount': '\$20.00',
      'date': '27/07/2024',
    },
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: CustomText(text: '')),
    AnalyticsScreen(),
    StoreScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(1, 19, 48, 1),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
            child: Column(
              children: [
                if (_selectedIndex == 0)
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfilePictureWidget(),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '¡Bienvenido de nuevo!',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            CustomText(text: 'Usuario'),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (_selectedIndex == 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Monto disponible:',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '\$${availableAmount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 15),
                if (_selectedIndex == 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        LinearGradientIndicator(
                          value: availableAmount / totalAmount,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                if (_selectedIndex == 0)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconContainer(
                            imagePath: 'assets/images/deposit_icon.png',
                            label: 'Ingresar'),
                        IconContainer(
                            imagePath: 'assets/images/transfer_icon.png',
                            label: 'Transferir'),
                        IconContainer(
                            imagePath: 'assets/images/clabe_icon.png',
                            label: 'Ingresar'),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tarjeta',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: 300,
                    height: 150,
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
                    child: Center(
                      child: Image.asset(
                        'assets/images/card_basic.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(76, 16, 57, 121),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFF40A2F1),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Últimos movimientos',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount:
                                movements.length > 5 ? 5 : movements.length,
                            itemBuilder: (context, index) {
                              final movement = movements[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          movement['title']!,
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF40A2F1),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          movement['amount']!,
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      movement['date']!,
                                      style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Divider(color: Colors.white),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Aquí se agregará el contenido de la pantalla seleccionada
                _widgetOptions.elementAt(_selectedIndex),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(onItemTapped: _onItemTapped),
    );
  }
}
