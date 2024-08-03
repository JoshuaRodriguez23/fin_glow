import 'package:fin_glow/presentation/screens/see_all_screen.dart';
import 'package:flutter/material.dart';
import './presentation/screens/login_screen.dart';
import './presentation/screens/register_screen.dart';
import './presentation/widgets/splashscreen.dart';
import './presentation/screens/home_screen.dart';

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
        '/': (context) => SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/seeAll': (context) => const SeeAllScreen(),
      },
    );
  }
}
