import 'dart:convert';
import 'package:fin_glow/domain/models/financial_advisor_model.dart';
import 'package:flutter/services.dart';

class FinancialAdvisorViewRepository {
  Future<FinancialAdvisorViewData> fetchFinancialAdvisorViewData() async {
    final String response =
        await rootBundle.loadString('assets/json/financial_advisor_data.json');
    final data = json.decode(response);
    return FinancialAdvisorViewData.fromJson(data);
  }
}
