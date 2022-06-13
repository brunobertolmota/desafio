import 'dart:convert';

import 'package:desafio/model/event_model.dart';
import 'package:http/http.dart' as http;

class EventsController {
  bool isError = false;
  var apiEventsUrl =
      Uri.parse('https://628e3133368687f3e7121f1a.mockapi.io/api/v1/events');

  Future<List<Event>> getEvents() async {
    var response = await http.get(apiEventsUrl);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return List.from(result).map((data) => Event.fromJson(data)).toList();
    } else {
      isError = true;
      throw Exception();
    }
  }
}
