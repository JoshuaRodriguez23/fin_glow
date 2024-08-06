import 'package:fin_glow/domain/models/movements_list_model.dart';
import 'package:fin_glow/domain/models/movements_model.dart';
import 'package:fin_glow/domain/repositories/movements_repository.dart';

class MovementUseCase {
  final MovementsRepository repository;

  MovementUseCase({required this.repository});

  // Método para obtener un solo movimiento
  Future<MovementsModel> fetchMovement(int id) async {
    final movement = await repository.fetchMovement(id);
    return movement;
  }

  // Método para obtener una lista de movimientos
  Future<MovementsListModel> fetchMovements() async {
    final movements = await repository.fetchMovements();
    return movements;
  }
}
