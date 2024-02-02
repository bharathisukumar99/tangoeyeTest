import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/survey_model.dart';

class RemoteService {
  static Future<Response> fetchSurvey() async {
    final String jsonString =
        await rootBundle.loadString("assets/response.json");
    var response = jsonDecode(jsonString);
    return Response.fromJson(response);
  }
}
