class WeeklyViewData {
  final String title;
  final double incomeAmount;
  final double expensesAmount;
  final List<BarChartData> barChartData;

  WeeklyViewData({
    required this.title,
    required this.incomeAmount,
    required this.expensesAmount,
    required this.barChartData,
  });

  factory WeeklyViewData.fromJson(Map<String, dynamic> json) {
    var barChartList = json['barChartData'] as List;
    List<BarChartData> barChartDataList =
        barChartList.map((i) => BarChartData.fromJson(i)).toList();

    return WeeklyViewData(
      title: json['title'],
      incomeAmount: json['income']['amount'],
      expensesAmount: json['expenses']['amount'],
      barChartData: barChartDataList,
    );
  }
}

class BarChartData {
  final String month;
  final double income;
  final double expenses;

  BarChartData({
    required this.month,
    required this.income,
    required this.expenses,
  });

  factory BarChartData.fromJson(Map<String, dynamic> json) {
    return BarChartData(
      month: json['month'],
      income:
          (json['income'] as num).toDouble(), // Asegúrate de convertir a double
      expenses: (json['expenses'] as num)
          .toDouble(), // Asegúrate de convertir a double
    );
  }
}
