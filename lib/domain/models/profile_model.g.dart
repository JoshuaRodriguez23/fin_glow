// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileOption _$ProfileOptionFromJson(Map<String, dynamic> json) =>
    ProfileOption(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$ProfileOptionToJson(ProfileOption instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'icon': instance.icon,
    };
