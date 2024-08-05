// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_advisor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialAdvisorViewData _$FinancialAdvisorViewDataFromJson(
        Map<String, dynamic> json) =>
    FinancialAdvisorViewData(
      title: json['title'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FinancialAdvisorViewDataToJson(
        FinancialAdvisorViewData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'question': instance.question,
      'options': instance.options,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      icon: json['icon'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };
