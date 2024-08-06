import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  final int id;
  final int id_account;
  final String card;
  final String card_account;
  final int status;

  CardModel({
    required this.id,
    required this.id_account,
    required this.card,
    required this.card_account,
    required this.status,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
