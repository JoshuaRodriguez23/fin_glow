import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_model.dart';

class LoginRepository {
  final Dio _dio = Dio();
  Logger logger = Logger();
  final String _baseUrl =
      'https://apimoviles-production.up.railway.app/auth/login/';

  Future<void> login(LoginModel loginModel) async {
    try {
      final response = await _dio.post(
        _baseUrl,
        data: loginModel.toJson(),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', response.data["access_token"]);
    } catch (e) {
      logger.d(loginModel.toJson());
      logger.d(e);
      throw Exception('Failed to login');
    }
  }
}
