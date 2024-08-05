import 'package:json_annotation/json_annotation.dart';

part 'weekly_model.g.dart';

@JsonSerializable()
class WeeklyViewData {
  final String title;
  @JsonKey(name: 'income')
  final double incomeAmount;
  @JsonKey(name: 'expenses')
  final double expensesAmount;
  final List<BarChartData> barChartData;

  WeeklyViewData({
    required this.title,
    required this.incomeAmount,
    required this.expensesAmount,
    required this.barChartData,
  });

  factory WeeklyViewData.fromJson(Map<String, dynamic> json) =>
      _$WeeklyViewDataFromJson(json);
  Map<String, dynamic> toJson() => _$WeeklyViewDataToJson(this);
}

@JsonSerializable()
class BarChartData {
  final String month;
  final double income;
  final double expenses;

  BarChartData({
    required this.month,
    required this.income,
    required this.expenses,
  });

  factory BarChartData.fromJson(Map<String, dynamic> json) =>
      _$BarChartDataFromJson(json);
  Map<String, dynamic> toJson() => _$BarChartDataToJson(this);
}
