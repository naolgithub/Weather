import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../weatherData/weather_data.dart';

Future fetchWeatherInfo(city) async {
  try {
    //api key=3d80701260e7ccb446e8821f1e68b5a8
    String apiKey = "3d80701260e7ccb446e8821f1e68b5a8";
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      double temperature = data["main"]["temp"];
      String main = data["weather"][0]["main"];
      double windSpeed = data["wind"]["speed"];
      int humidity = data["main"]["humidity"];
      int visibility = data["visibility"];
      String name = data["name"];

      return WeatherData(
        name: name,
        temperature: temperature,
        main: main,
        windSpeed: windSpeed,
        humidity: humidity,
        visibility: visibility,
      );
    }
  } catch (e) {
    debugPrint("error$e");
  }
}
