import 'dart:convert';
import 'package:fin_glow/domain/repositories/account_repository.dart';
import 'package:fin_glow/domain/repositories/cash_data_repository.dart';
import 'package:fin_glow/domain/repositories/movements_repository.dart';
import 'package:fin_glow/domain/repositories/user_repository.dart';
import 'package:fin_glow/domain/usecases/account_usecase.dart';
import 'package:fin_glow/domain/usecases/movements_usecase.dart';
import 'package:fin_glow/domain/usecases/user_usecase.dart';
import 'package:fin_glow/presentation/bloc/bloc/movements_bloc.dart';
import 'package:fin_glow/presentation/bloc/bloc/user_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/movements_event.dart';
import 'package:fin_glow/presentation/bloc/event/user_event.dart';
import 'package:fin_glow/presentation/bloc/state/movements_state.dart';
import 'package:fin_glow/presentation/bloc/state/user_state.dart';
import 'package:fin_glow/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/navigation_bar.dart';
import '../screens/analytics_screen.dart';
import '../screens/store_screen.dart';
import '../screens/more_screen.dart';
import '../widgets/linear_gradient.dart';
import '../widgets/icon_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> movements = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response =
        await rootBundle.loadString('assets/json/movements.json');
    final data = await json.decode(response) as List;
    setState(() {
      movements = data.map((e) => e as Map<String, dynamic>).toList();
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: _selectedIndex == 0
              ? SingleChildScrollView(
                  child: buildHomeContent(),
                )
              : _widgetOptions[_selectedIndex - 1],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(onItemTapped: _onItemTapped),
    );
  }

  Widget buildHomeContent() {
    final userRepository = UserRepository();
    final userUseCase = UserUseCase(userRepository);
    final accountRepository = AccountRepository();
    final accountUseCase = AccountUseCase(repository: accountRepository);

    return BlocProvider(
      create: (context) =>
          UserBloc(userUseCase, accountUseCase)..add(GetUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserSuccess) {
          final availableAmount = state.account.balance;
          final totalAmount = availableAmount! * 2;

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ProfilePictureWidget(),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '¡Bienvenido de nuevo!',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            '${state.user.name} ${state.user.lastname}',
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                        state.account.balance.toString(),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: LinearGradientIndicator(
                    value:
                        totalAmount > 0 ? availableAmount / totalAmount : 0.0,
                  ),
                ),
                const SizedBox(height: 20),
                buildIconButtons(),
                const SizedBox(height: 20),
                buildCardSection(context),
                const SizedBox(height: 20),
                buildMovementsSection(context),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget buildIconButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconContainer(
              imagePath: 'assets/images/deposit_icon.png', label: 'Ingresar'),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/transfer');
            },
            child: const IconContainer(
                imagePath: 'assets/images/transfer_icon.png',
                label: 'Transferir'),
          ),
          const IconContainer(
              imagePath: 'assets/images/clabe_icon.png', label: 'Ingresar'),
        ],
      ),
    );
  }

  Widget buildCardSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/cardDetails');
        },
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 300, maxHeight: 150),
          decoration: BoxDecoration(
            color: const Color.fromARGB(76, 16, 57, 121),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color(0xFF40A2F1),
              width: 2,
            ),
            gradient: const LinearGradient(
              colors: [Color(0xFF40A2F1), Color(0xFF103979)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Image.asset('assets/images/card_basic.png',
                width: 200, height: 200),
          ),
        ),
      ),
    );
  }

  Widget buildMovementsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Últimos movimientos:',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/seeAll');
                },
                child: const Text(
                  'Ver todos',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color.fromRGBO(34, 221, 187, 1),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocProvider(
            create: (context) =>
                MovementBloc(MovementUseCase(repository: MovementsRepository()))
                  ..add(GetMovementsEvent()),
            child: BlocBuilder<MovementBloc, MovementState>(
              builder: (context, state) {
                if (state is MovementInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovementsSuccess) {
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(76, 16, 57, 121),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: state.movements
                          .map((movement) => ListTile(
                                title: Text(
                                  movement.id_service.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  movement.reference,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                trailing: Text(
                                  movement.amount.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
