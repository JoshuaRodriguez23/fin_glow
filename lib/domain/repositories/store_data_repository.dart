import 'dart:convert';
import 'package:fin_glow/domain/models/store_model.dart';
import 'package:flutter/services.dart';

class StoreViewRepository {
  Future<StoreViewData> fetchStoreViewData() async {
    final String response =
        await rootBundle.loadString('assets/json/store_data.json');
    final data = await json.decode(response);
    return StoreViewData.fromJson(data);
  }
}
