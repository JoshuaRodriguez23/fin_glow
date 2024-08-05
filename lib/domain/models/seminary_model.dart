import 'package:json_annotation/json_annotation.dart';

part 'seminary_model.g.dart';

@JsonSerializable()
class Event {
  final String icon;
  final String title;
  final String description;

  Event({
    required this.icon,
    required this.title,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
