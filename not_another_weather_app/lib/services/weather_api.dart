import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:not_another_weather_app/models/api_failure.dart';
import 'package:not_another_weather_app/models/weather.dart';

class WeatherApi {
  // TODO: poner en constants
  final String apiKey = '2bae4d5b768bdd1a675211939eaeb313';

  final String apiUrl = 'https://api.openweathermap.org/data/2.5/';

  Future<Weather> getWeather(Coord gpdCoords) async {
    try {
      var response = await http.get(Uri.parse(
          "$apiUrl weather?lat=${gpdCoords.lat}lon=${gpdCoords.lon}&appid=$apiKey"));

      Weather userInfoResult = weatherFromJson(response.body);
      return userInfoResult;
    } on SocketException {
      throw ApiFailure(message: 'No internet conection');
    } on HttpException {
      throw ApiFailure(message: 'Bad request to API');
    } on FormatException {
      throw ApiFailure(message: 'Bad response format');
    }
  }
}
