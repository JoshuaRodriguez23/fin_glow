import 'package:dio/dio.dart';
import 'package:fin_glow/domain/models/register_model.dart';
import 'package:logger/logger.dart';

class RegisterRepositoryImpl {
  final Dio _dio = Dio();
  Logger logger = Logger();

  Future<void> submitUser(RegisterModel register) async {
    try {
      await _dio.post('https://apimoviles-production.up.railway.app/users',
          data: register.toJson());
    } catch (e) {
      logger.d(e);
      throw Exception('Failed to submit Register');
    }
  }
}
