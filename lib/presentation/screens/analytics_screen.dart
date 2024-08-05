import 'package:fin_glow/presentation/bloc/bloc/weekly_bloc.dart';
import 'package:fin_glow/presentation/screens/weekly_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/domain/models/weekly_model.dart';
import 'package:fin_glow/domain/repositories/weekly_data_repository.dart';
import 'package:fin_glow/presentation/bloc/event/weekly_event.dart';
import 'package:fin_glow/presentation/bloc/state/weekly_state.dart';
import '../widgets/oval_navbar.dart';
import '../widgets/custom_app_bar.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  AnalyticsScreenState createState() => AnalyticsScreenState();
}

class AnalyticsScreenState extends State<AnalyticsScreen> {
  int _currentIndex = 0;
  late WeeklyBloc _weeklyBloc;
  List<WeeklyViewData> _viewsData = [];

  @override
  void initState() {
    super.initState();
    _weeklyBloc = WeeklyBloc(WeeklyViewRepository());
    _fetchData();
  }

  void _fetchData() {
    _weeklyBloc.add(FetchWeeklyData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _weeklyBloc,
      child: Scaffold(
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
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'Panel financiero',
                  ),
                  const SizedBox(height: 20),
                  OvalNavbar(
                    options: const ['Semanal', 'Mensual', 'Anual'],
                    onOptionSelected: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: BlocBuilder<WeeklyBloc, WeeklyState>(
                      builder: (context, state) {
                        if (state is WeeklyLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is WeeklyLoaded) {
                          _viewsData = [state.data, state.data, state.data];
                          return WeeklyView(data: _viewsData[_currentIndex]);
                        } else if (state is WeeklyError) {
                          return Center(child: Text(state.message));
                        } else {
                          return Center(child: Text('Unexpected state'));
                        }
                      },
                    ),
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
