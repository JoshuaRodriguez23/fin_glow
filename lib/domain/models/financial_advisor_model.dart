class FinancialAdvisorViewData {
  final String title;
  final String question;
  final List<Option> options;

  FinancialAdvisorViewData({
    required this.title,
    required this.question,
    required this.options,
  });

  factory FinancialAdvisorViewData.fromJson(Map<String, dynamic> json) {
    var optionsList = json['options'] as List;
    List<Option> optionsData =
        optionsList.map((i) => Option.fromJson(i)).toList();

    return FinancialAdvisorViewData(
      title: json['title'],
      question: json['question'],
      options: optionsData,
    );
  }
}

class Option {
  final String icon;
  final String title;
  final String subtitle;

  Option({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      icon: json['icon'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
