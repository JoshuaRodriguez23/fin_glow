// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyViewData _$WeeklyViewDataFromJson(Map<String, dynamic> json) =>
    WeeklyViewData(
      title: json['title'] as String,
      incomeAmount: (json['income'] as num).toDouble(),
      expensesAmount: (json['expenses'] as num).toDouble(),
      barChartData: (json['barChartData'] as List<dynamic>)
          .map((e) => BarChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeeklyViewDataToJson(WeeklyViewData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'income': instance.incomeAmount,
      'expenses': instance.expensesAmount,
      'barChartData': instance.barChartData,
    };

BarChartData _$BarChartDataFromJson(Map<String, dynamic> json) => BarChartData(
      month: json['month'] as String,
      income: (json['income'] as num).toDouble(),
      expenses: (json['expenses'] as num).toDouble(),
    );

Map<String, dynamic> _$BarChartDataToJson(BarChartData instance) =>
    <String, dynamic>{
      'month': instance.month,
      'income': instance.income,
      'expenses': instance.expenses,
    };
