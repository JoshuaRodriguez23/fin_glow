import 'package:fin_glow/presentation/screens/transfer_screen.dart';
import 'package:fin_glow/presentation/widgets/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/domain/repositories/weekly_data_repository.dart';
import 'package:fin_glow/presentation/bloc/bloc/weekly_bloc.dart';
import 'package:fin_glow/presentation/bloc/bloc/store_bloc.dart';
import 'package:fin_glow/domain/repositories/store_data_repository.dart';
import 'package:fin_glow/presentation/bloc/bloc/seminary_bloc.dart';
import 'package:fin_glow/domain/repositories/seminary_data_repository.dart';
import 'package:fin_glow/domain/repositories/profile_data_repository.dart';
import 'package:fin_glow/presentation/bloc/bloc/profile_bloc.dart';
import './presentation/screens/login_screen.dart';
import './presentation/screens/register_screen.dart';
import './presentation/screens/home_screen.dart';
import './presentation/screens/see_all_screen.dart';
import './presentation/screens/see_more_screen.dart';
import './presentation/screens/card_details_screen.dart';
import './presentation/screens/profile_screen.dart';
import './presentation/screens/financial_advisor_screen.dart';
import './presentation/screens/seminary_and_events_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final profileRepository = ProfileRepository();
    final eventRepository = EventRepository();
    final storeRepository = StoreViewRepository();
    final weeklyRepository = WeeklyViewRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) =>
              ProfileBloc(profileRepository: profileRepository),
        ),
        BlocProvider<EventBloc>(
          create: (context) => EventBloc(eventRepository: eventRepository),
        ),
        BlocProvider<StoreBloc>(
          create: (context) => StoreBloc(storeViewRepository: storeRepository),
        ),
        BlocProvider<WeeklyBloc>(
          create: (context) => WeeklyBloc(weeklyRepository),
        ),
      ],
      child: MaterialApp(
        title: 'FinGlow',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/seeAll': (context) => const SeeAllScreen(),
          '/seeMore': (context) => const ViewMoreScreen(),
          '/cardDetails': (context) => const CardDetailsScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/financialAdvisor': (context) => const FinancialAdvisorScreen(),
          '/seminaryEvents': (context) => const SeminaryAndEventsScreen(),
          '/transfer': (context) => const TransferScreen(),
        },
      ),
    );
  }
}
