import 'package:fin_glow/domain/models/financial_advisor_model.dart';
import 'package:fin_glow/domain/repositories/financial_advisor_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:fin_glow/presentation/widgets/custom_app_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class FinancialAdvisorScreen extends StatefulWidget {
  const FinancialAdvisorScreen({super.key});

  @override
  FinancialAdvisorScreenState createState() => FinancialAdvisorScreenState();
}

class FinancialAdvisorScreenState extends State<FinancialAdvisorScreen> {
  late Future<FinancialAdvisorViewData> financialAdvisorViewData;

  @override
  void initState() {
    super.initState();
    financialAdvisorViewData =
        FinancialAdvisorViewRepository().fetchFinancialAdvisorViewData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FinancialAdvisorViewData>(
      future: financialAdvisorViewData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final data = snapshot.data!;

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
          ),
        );
      },
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
