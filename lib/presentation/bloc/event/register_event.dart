import 'package:equatable/equatable.dart';
import 'package:fin_glow/domain/models/register_model.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SubmitRegisterEvent extends RegisterEvent {
  final RegisterModel register;

  const SubmitRegisterEvent(this.register);

  @override
  List<Object> get props => [register];
}
