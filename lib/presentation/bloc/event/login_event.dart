import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/login_model.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitEvent extends LoginEvent {
  final LoginModel loginModel;

  const LoginSubmitEvent(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}
