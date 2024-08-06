import 'package:fin_glow/domain/repositories/register_repository.dart';
import 'package:fin_glow/domain/repositories/store_data_repository.dart';
import 'package:fin_glow/domain/usecases/register_usecase.dart';
import 'package:fin_glow/presentation/bloc/bloc/register_bloc.dart';
import 'package:fin_glow/presentation/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/domain/usecases/profile_usecase.dart';
import 'package:fin_glow/domain/usecases/seminary_usecase.dart';
import 'package:fin_glow/domain/usecases/weekly_usecase.dart';
import 'package:fin_glow/domain/repositories/seminary_data_repository.dart';
import 'package:fin_glow/domain/repositories/profile_data_repository.dart';
import 'package:fin_glow/domain/repositories/weekly_data_repository.dart';
import 'package:fin_glow/presentation/bloc/bloc/seminary_bloc.dart';
import 'package:fin_glow/presentation/bloc/bloc/profile_bloc.dart';
import 'package:fin_glow/presentation/bloc/bloc/store_bloc.dart';
import 'package:fin_glow/presentation/bloc/bloc/weekly_bloc.dart';
import 'package:fin_glow/presentation/widgets/splashscreen.dart';
import 'package:fin_glow/presentation/screens/login_screen.dart';
import 'package:fin_glow/presentation/screens/register_screen.dart';
import 'package:fin_glow/presentation/screens/home_screen.dart';
import 'package:fin_glow/presentation/screens/see_all_screen.dart';
import 'package:fin_glow/presentation/screens/see_more_screen.dart';
import 'package:fin_glow/presentation/screens/card_details_screen.dart';
import 'package:fin_glow/presentation/screens/profile_screen.dart';
import 'package:fin_glow/presentation/screens/financial_advisor_screen.dart';
import 'package:fin_glow/presentation/screens/seminary_and_events_screen.dart';

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
    final profileUseCase = FetchAndValidateProfileData(profileRepository);
    final fetchSeminaryEvents = FetchSeminaryEvents(eventRepository);
    final weeklyDataUseCase = WeeklyDataUseCase(weeklyRepository);
    final registerRepository = RegisterRepositoryImpl();
    final submitRegister = SubmitRegister(registerRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) =>
              ProfileBloc(fetchAndValidateProfileData: profileUseCase),
        ),
        BlocProvider<EventBloc>(
          create: (context) =>
              EventBloc(fetchSeminaryEvents: fetchSeminaryEvents),
        ),
        BlocProvider<StoreBloc>(
          create: (context) => StoreBloc(storeViewRepository: storeRepository),
        ),
        BlocProvider<WeeklyBloc>(
          create: (context) => WeeklyBloc(weeklyDataUseCase),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) =>
              RegisterBloc(submitRegister), // Aquí se pasa el argumento
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
