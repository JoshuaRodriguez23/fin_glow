import 'package:json_annotation/json_annotation.dart';

part 'financial_advisor_model.g.dart';

@JsonSerializable()
class FinancialAdvisorViewData {
  final String title;
  final String question;
  final List<Option> options;

  FinancialAdvisorViewData({
    required this.title,
    required this.question,
    required this.options,
  });

  factory FinancialAdvisorViewData.fromJson(Map<String, dynamic> json) =>
      _$FinancialAdvisorViewDataFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialAdvisorViewDataToJson(this);
}

@JsonSerializable()
class Option {
  final String icon;
  final String title;
  final String subtitle;

  Option({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
