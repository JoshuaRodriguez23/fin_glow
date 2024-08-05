import 'package:fin_glow/domain/repositories/financial_advisor_data_repository.dart';
import 'package:fin_glow/presentation/bloc/bloc/financial_advisor_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/financial_advisor_event.dart';
import 'package:fin_glow/presentation/bloc/state/financial_advisor_state.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class FinancialAdvisorScreen extends StatelessWidget {
  const FinancialAdvisorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FinancialAdvisorBloc(FinancialAdvisorViewRepository())
            ..add(FetchFinancialAdvisorData()),
      child: Scaffold(
        body: BlocBuilder<FinancialAdvisorBloc, FinancialAdvisorState>(
          builder: (context, state) {
            if (state is FinancialAdvisorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FinancialAdvisorError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is FinancialAdvisorLoaded) {
              final data = state.data;

              return GestureDetector(
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
                        CustomAppBar(title: data.title),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.question,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: data.options.map((option) {
                                  return Column(
                                    children: [
                                      _buildOptionContainer(
                                        icon: _getIcon(option.icon),
                                        title: option.title,
                                        subtitle: option.subtitle,
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container(); // Fallback case
          },
        ),
      ),
    );
  }

  Widget _buildOptionContainer({
    required IconData icon,
    required String title,
    required String subtitle,
    Color iconColor = Colors.white,
  }) {
    return Container(
      width: double.infinity,
      height: 100,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(icon, color: iconColor),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case "Bootstrap.chat":
        return Bootstrap.chat;
      case "Bootstrap.whatsapp":
        return Bootstrap.whatsapp;
      case "Bootstrap.telephone":
        return Bootstrap.telephone;
      case "Bootstrap.envelope":
        return Bootstrap.envelope;
      case "Bootstrap.camera_video":
        return Bootstrap.camera_video;
      default:
        return Bootstrap.chat;
    }
  }
}
