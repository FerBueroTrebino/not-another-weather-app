import 'dart:math';

import 'package:flutter/material.dart';

import 'package:not_another_weather_app/constants.dart';
import 'package:not_another_weather_app/models/api_failure.dart';
import 'package:not_another_weather_app/models/weather.dart';
import 'package:not_another_weather_app/services/weather_api.dart';

enum NotifierState { initial, loading, loaded }

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

  Coord _getRandomCoords() {
    final random = Random();
    double randomLat = -90 + random.nextDouble() * 90 * 2;
    double randomLng = -180 + random.nextDouble() * 180 * 2;
    return Coord(lat: randomLat, lon: randomLng);
  }

  getCityWeather() async {
    _setState(NotifierState.loading);
    // Coord sampleCoord = Coord(lat: 41.39182, lon: 2.1719681);

    try {
      Weather weather = await weatherApi.getWeather(
          _getRandomCoords(), Units.metric.toShortString());

      // If the random location doestn have a city name asociated, will get a new location.
      if (weather.name == '') {
        getCityWeather();
      } else {
        setWeather(weather);
        _setState(NotifierState.loaded);
      }
    } on ApiFailure catch (f) {
      _setState(NotifierState.loaded);
      setFailure(f);
    }
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }
}
