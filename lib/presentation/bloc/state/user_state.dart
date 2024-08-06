import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/account_model.dart';
import 'package:fin_glow/domain/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel user;
  final AccountModel account;
  const UserSuccess(this.user, this.account);
  @override
  List<Object> get props => [user];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
