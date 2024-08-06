import 'package:fin_glow/domain/models/user_model.dart';
import 'package:fin_glow/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository repository;

  UserUseCase(this.repository);

  Future<UserModel> call() async {
    return await repository.UserFetch();
  }
}
