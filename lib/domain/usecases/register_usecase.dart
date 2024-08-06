import 'package:fin_glow/domain/models/register_model.dart';
import 'package:fin_glow/domain/repositories/register_repository.dart';

class SubmitRegister {
  final RegisterRepositoryImpl repository;

  SubmitRegister(this.repository);

  Future<void> call(RegisterModel register) async {
    await repository.submitUser(register);
  }
}
