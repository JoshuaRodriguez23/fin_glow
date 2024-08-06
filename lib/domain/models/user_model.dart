import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final int id_bank;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.rfc,
    required this.phone,
    required this.password,
    required this.id_bank,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
