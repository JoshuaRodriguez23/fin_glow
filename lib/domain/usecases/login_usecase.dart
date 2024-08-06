import '../models/login_model.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<void> call(LoginModel loginModel) async {
    return await repository.login(loginModel);
  }
}
