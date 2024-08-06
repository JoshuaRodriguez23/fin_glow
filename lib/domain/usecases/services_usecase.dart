import 'package:fin_glow/domain/models/services_model.dart';
import 'package:fin_glow/domain/repositories/services_repository.dart';

class ServicesUseCase {
  final ServicesRepository repository;

  ServicesUseCase({required this.repository});

  Future<ServicesResponse> call() async {
    final services = await repository.fetchServices();
    return services;
  }
}
