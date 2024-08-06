import 'package:fin_glow/domain/models/movements_list_model.dart';
import 'package:fin_glow/domain/models/movements_model.dart';
import 'package:fin_glow/network/instances/dioInstance.dart';
import 'package:fin_glow/network/services/sharedPreferencesServices.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';

class MovementsRepository {
  final Logger logger = Logger();

  // Método para obtener un solo movimiento
  Future<MovementsModel> fetchMovement(int id) async {
    try {
      final _dio = await DioClient.getInstance();
      final response = await _dio.get('/log-services/$id');
      logger.d(response);
      return MovementsModel.fromJson(response.data['data']);
    } catch (e) {
      logger.d(e);
      throw Exception('Failed to fetch movement');
    }
  }

  // Método para obtener una lista de movimientos
  Future<MovementsListModel> fetchMovements() async {
    final sharedPreferences = SharedPreferencesService();

    try {
      final token = await sharedPreferences.getAuthToken();
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      int id = decodedToken['id'];
      final _dio = await DioClient.getInstance();
      final response = await _dio.get('/log-services');
      logger.d(response);
      var responseMovements = MovementsListModel.fromJson(response.data);
      var mov =
          responseMovements.movements.where((x) => x.id_users == id).toList();
      responseMovements.movements = mov;
      return responseMovements;
    } catch (e) {
      logger.d(e);
      throw Exception('Failed to fetch movements');
    }
  }
}
