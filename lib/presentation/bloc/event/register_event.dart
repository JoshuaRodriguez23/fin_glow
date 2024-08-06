import 'package:fin_glow/domain/models/register_model.dart';

abstract class RegisterEvent {}

class RegisterSubmit extends RegisterEvent {
  final RegisterModel registerModel;

  RegisterSubmit(this.registerModel);
}
