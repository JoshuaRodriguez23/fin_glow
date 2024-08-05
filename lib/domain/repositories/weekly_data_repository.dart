import 'dart:convert';
import 'package:fin_glow/domain/models/weekly_model.dart';
import 'package:flutter/services.dart';

class WeeklyViewRepository {
  Future<WeeklyViewData> fetchWeeklyViewData() async {
    final String response =
        await rootBundle.loadString('assets/json/weekly_data.json');
    final data = await json.decode(response);
    return WeeklyViewData.fromJson(data);
  }
}
