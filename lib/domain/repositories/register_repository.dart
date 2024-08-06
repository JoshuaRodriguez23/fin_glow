import 'package:dio/dio.dart';
import 'package:fin_glow/domain/models/register_model.dart';
import 'package:logger/logger.dart';

class RegisterRepository {
  final Dio dio;
  final Logger logger = Logger();

  RegisterRepository(this.dio);

  Future<void> register(RegisterModel registerModel) async {
    try {
      final response = await dio.post(
        'https://apimoviles-production.up.railway.app/users',
        data: registerModel.toJson(),
      );
      logger.d('Registro exitoso: ${response.data}');
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          logger.e('Error al registrarse: ${e.response!.data}');
          throw Exception(e.response!.data);
        } else {
          logger.e('Error inesperado: $e');
          throw Exception('Error inesperado: $e');
        }
      } else {
        logger.e('Error al registrarse: $e');
        throw Exception('Error al registrarse: $e');
      }
    }
  }
}
