// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: (json['id'] as num).toInt(),
      idUser: (json['idUser'] as num).toInt(),
      balance: (json['balance'] as num?)?.toDouble(),
      status: (json['status'] as num).toInt(),
      card: (json['card'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUser': instance.idUser,
      'balance': instance.balance,
      'status': instance.status,
      'card': instance.card,
      'user': instance.user,
    };
