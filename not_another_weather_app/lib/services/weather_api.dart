import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:not_another_weather_app/constants.dart';
import 'package:not_another_weather_app/models/weather.dart';
import 'package:not_another_weather_app/models/api_failure.dart';

class WeatherApi {
  Future<Weather> getWeather(Coord gpdCoords, String unit) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "${apiUrl}weather?lat=${gpdCoords.lat}&lon=${gpdCoords.lon}&units=$unit&appid=$apiKey",
        ),
      );

      if (response.statusCode == 200) {
        try {
          Weather userInfoResult = weatherFromJson(response.body);
          return userInfoResult;
        } catch (e) {
          throw ApiFailure(
              message: 'Bad response JSON format',
              errorCode: response.statusCode);
        }
      } else {
        throw ApiFailure(
            message: 'Bad request to API', errorCode: response.statusCode);
      }
    } on SocketException {
      throw ApiFailure(message: 'No internet conection');
    } on HttpException {
      throw ApiFailure(message: 'Bad request to API');
    } on FormatException {
      throw ApiFailure(message: 'Bad response format');
    }
  }
}
