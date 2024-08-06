import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart'; // Asegúrate de que el nombre del archivo sea correcto

@JsonSerializable()
class LoginModel {
  final String phone;
  final String password;

  LoginModel({
    required this.phone,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class LoginResponse {
  final String accessToken;

  LoginResponse({
    required this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
