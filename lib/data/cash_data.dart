import 'dart:convert';
import 'package:flutter/services.dart';

class CashDataView {
  final double availableAmount;
  final double totalAmount;

  CashDataView({required this.availableAmount, required this.totalAmount});

  factory CashDataView.fromJson(Map<String, dynamic> json) {
    return CashDataView(
      availableAmount: json['availableAmount'],
      totalAmount: json['totalAmount'],
    );
  }

  static Future<CashDataView> loadFromAsset() async {
    final String response = await rootBundle.loadString('assets/json/cash_data.json');
    final data = await json.decode(response);
    return CashDataView.fromJson(data);
  }
}
