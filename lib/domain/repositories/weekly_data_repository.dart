import 'dart:convert';
import 'package:fin_glow/domain/models/weekly_model.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class WeeklyViewRepository {
  final logger = Logger();
  Future<WeeklyViewData> fetchWeeklyViewData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/weekly_data.json');
      logger.d('Response: $response');
      final data = json.decode(response);
      logger.d('Decoded data: $data');
      return WeeklyViewData.fromJson(data);
    } catch (e) {
      logger.d('Error: $e');
      throw Exception('Failed to load data');
    }
  }
}
