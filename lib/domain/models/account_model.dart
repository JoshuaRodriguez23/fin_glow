import 'package:fin_glow/domain/models/card_model.dart';
import 'package:fin_glow/domain/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  final int id;
  final int id_user;
  final double? balance;
  final int status;
  final List<CardModel> card;
  final UserModel user;

  AccountModel({
    required this.id,
    required this.id_user,
    this.balance,
    required this.status,
    required this.card,
    required this.user,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
