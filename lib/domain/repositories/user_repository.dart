import 'package:fin_glow/domain/models/user_model.dart';
import 'package:fin_glow/network/instances/dioInstance.dart';
import 'package:logger/logger.dart';

class UserRepository {
  Logger logger = Logger();

  Future<UserModel> UserFetch() async {
    try {
      final _dio = await DioClient.getInstance();
      final response = await _dio.get('/users');
      logger.d(response);
      logger.d(UserModel.fromJson(response.data['data']));
      return UserModel.fromJson(response.data['data']);
    } catch (e) {
      logger.d(e);
      throw Exception('Failed to login');
    }
  }
}
