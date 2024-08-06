import 'package:json_annotation/json_annotation.dart';

part 'services_model.g.dart';

@JsonSerializable()
class Service {
  final int id;
  final String name;
  final bool status;
  final String icono;

  Service({
    required this.id,
    required this.name,
    required this.status,
    required this.icono,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class ServicesResponse {
  final List<Service> services;

  ServicesResponse({
    required this.services,
  });

  factory ServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}
