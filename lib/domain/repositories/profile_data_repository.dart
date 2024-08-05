import 'dart:convert';
import 'package:fin_glow/domain/models/profile_model.dart';
import 'package:flutter/services.dart';

class ProfileRepository {
  Future<List<ProfileOption>> fetchProfileOptions() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/profile_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => ProfileOption.fromJson(json)).toList();
  }
}
