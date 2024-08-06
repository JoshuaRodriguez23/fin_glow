// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementsModel _$MovementsModelFromJson(Map<String, dynamic> json) =>
    MovementsModel(
      id: (json['id'] as num).toInt(),
      amount: json['amount'] as String,
      reference: json['reference'] as String,
      id_service: (json['id_service'] as num).toInt(),
      id_users: (json['id_users'] as num).toInt(),
      id_account: (json['id_account'] as num).toInt(),
    );

Map<String, dynamic> _$MovementsModelToJson(MovementsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'reference': instance.reference,
      'id_service': instance.id_service,
      'id_users': instance.id_users,
      'id_account': instance.id_account,
    };
