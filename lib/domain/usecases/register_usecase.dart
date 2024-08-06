import 'package:fin_glow/domain/models/register_model.dart';
import 'package:fin_glow/domain/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);

  Future<void> execute(RegisterModel registerModel) {
    return repository.register(registerModel);
  }
}
