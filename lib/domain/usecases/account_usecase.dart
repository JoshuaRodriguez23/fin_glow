import 'package:fin_glow/domain/models/account_model.dart';
import 'package:fin_glow/domain/repositories/account_repository.dart';

class AccountUseCase {
  final AccountRepository repository;

  AccountUseCase({required this.repository});

  Future<AccountModel> call() async {
    final account = await repository.fetchAccount();
    return account;
  }
}
