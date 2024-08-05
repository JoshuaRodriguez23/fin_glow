import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileOption {
  final String title;
  final String subtitle;
  final String icon; // Mantener como String para el ícono

  ProfileOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  factory ProfileOption.fromJson(Map<String, dynamic> json) =>
      _$ProfileOptionFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileOptionToJson(this);
}
