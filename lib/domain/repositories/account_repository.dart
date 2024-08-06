import 'package:fin_glow/domain/models/account_model.dart';
import 'package:fin_glow/network/instances/dioInstance.dart';
import 'package:logger/logger.dart';

class AccountRepository {
  final Logger logger = Logger();

  Future<AccountModel> fetchAccount() async {
    try {
      final _dio = await DioClient.getInstance();
      final response = await _dio.get('/accounts/me');
      logger.d(response);
      logger.d(AccountModel.fromJson(response.data['data']));
      return AccountModel.fromJson(response.data['data']);
    } catch (e) {
      logger.d(e);
      throw Exception('Failed to fetch account');
    }
  }
}
