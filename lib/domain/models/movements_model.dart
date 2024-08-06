import 'package:json_annotation/json_annotation.dart';

part 'movements_model.g.dart';

@JsonSerializable()
class MovementsModel {
  final int id;
  final String amount;
  final String reference;
  final int id_service;
  final int id_users;
  final int id_account;

  MovementsModel({
    required this.id,
    required this.amount,
    required this.reference,
    required this.id_service,
    required this.id_users,
    required this.id_account,
  });

  factory MovementsModel.fromJson(Map<String, dynamic> json) =>
      _$MovementsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovementsModelToJson(this);
}
