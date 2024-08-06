import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fin_glow/presentation/bloc/bloc/services_bloc.dart';
import 'package:fin_glow/presentation/bloc/event/services_event.dart';
import 'package:fin_glow/presentation/bloc/state/services_state.dart';

class PromotionsScreen extends StatelessWidget {
  const PromotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        if (state is ServicesInitial) {
          context.read<ServicesBloc>().add(GetServicesEvent());
        }
        return Container(
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
            child: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                if (state is ServicesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ServicesError) {
                  return Center(
                    child: Text(
                      'Error en el screen: ${state.message}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                } else if (state is ServicesSuccess) {
                  final services = state.services.services;

                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 50,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: services.map((service) {
                        if (service.status) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 120,
                              height: 120,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Image.network(
                                        service.icono,
                                        color: Colors.blue,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Center(
                                    child: Text(
                                      service.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return Container();
                      }).toList(),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
