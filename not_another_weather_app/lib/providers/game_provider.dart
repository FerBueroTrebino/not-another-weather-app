import 'package:flutter/material.dart';

import 'package:not_another_weather_app/constants.dart';
import 'package:not_another_weather_app/models/api_failure.dart';
import 'package:not_another_weather_app/models/weather.dart';
import 'package:not_another_weather_app/services/weather_api.dart';

class GameProvider extends ChangeNotifier {
  GameProvider() {
    getCityWeather();
  }
  final weatherApi = WeatherApi();

  Weather _weather = Weather(main: Main());
  Weather get weather => _weather;

  setWeather(Weather newWeather) {
    _weather = newWeather;
    notifyListeners();
  }

  ApiFailure? _failure;
  ApiFailure? get failure => _failure;
  void setFailure(ApiFailure failure) {
    _failure = failure;
    notifyListeners();
  }

  getCityWeather() async {
    Coord sampleCoord = Coord(lat: 41.39182, lon: 2.1719681);

    try {
      Weather weather = await weatherApi.getWeather(
          sampleCoord, Units.metric.toShortString());
      setWeather(weather);
    } on ApiFailure catch (f) {
      setFailure(f);
    }
  }
}
