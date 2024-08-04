import 'package:fin_glow/presentation/screens/card_details_screen.dart';
import 'package:fin_glow/presentation/screens/financial_advisor_screen.dart';
import 'package:fin_glow/presentation/screens/profile_screen.dart';
import 'package:fin_glow/presentation/screens/see_all_screen.dart';
import 'package:fin_glow/presentation/screens/seminary_and_events_screen.dart';
import 'package:flutter/material.dart';
import './presentation/screens/login_screen.dart';
import './presentation/screens/register_screen.dart';
import './presentation/widgets/splashscreen.dart';
import './presentation/screens/home_screen.dart';
import './presentation/screens/see_more_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
