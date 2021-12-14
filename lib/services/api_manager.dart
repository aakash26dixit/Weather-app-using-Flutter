import 'dart:io';

import 'package:flutter_application_1/constants/strings.dart';
import 'package:flutter_application_1/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API_Manager {
  Future<Welcome> getWeather() async {
    var client = http.Client();
    var welcome = null;

    try {
      var response = await client.get(Uri.parse(Strings.weather));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var welcome = Welcome.fromJson(jsonMap);
      }
    } catch (e) {
      // return welcome;
      print(e);
    }
  }
}
