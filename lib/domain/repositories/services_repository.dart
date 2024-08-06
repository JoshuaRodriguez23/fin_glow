import 'package:fin_glow/domain/models/services_model.dart';
import 'package:fin_glow/network/instances/dioInstance.dart';
import 'package:logger/logger.dart';

class ServicesRepository {
  final Logger logger = Logger();

  Future<ServicesResponse> fetchServices() async {
    try {
      final _dio = await DioClient.getInstance();
      final response = await _dio.get('/services');
      logger.d(response);

      List<Service> services = (response.data as List)
          .map((serviceJson) => Service.fromJson(serviceJson))
          .toList();

      logger.d(services);
      return ServicesResponse(services: services);
    } catch (e) {
      logger.d('Hola: $e');
      throw Exception('Failed to fetch services');
    }
  }
}
