import 'dart:convert';
import 'package:fin_glow/domain/models/seminary_model.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class EventRepository {
  Future<List<Event>> fetchEvents() async {
    final Logger logger = Logger();

    final String response =
        await rootBundle.loadString('assets/json/seminary_data.json');
    final data = await json.decode(response);

    logger.d(data); // Imprimir el contenido del JSON

    return (data['events'] as List)
        .map((event) => Event.fromJson(event))
        .toList();
  }
}
