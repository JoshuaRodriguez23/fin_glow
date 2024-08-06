// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movements_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementsListModel _$MovementsListModelFromJson(Map<String, dynamic> json) =>
    MovementsListModel(
      movements: (json['movements'] as List<dynamic>)
          .map((e) => MovementsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovementsListModelToJson(MovementsListModel instance) =>
    <String, dynamic>{
      'movements': instance.movements,
    };
