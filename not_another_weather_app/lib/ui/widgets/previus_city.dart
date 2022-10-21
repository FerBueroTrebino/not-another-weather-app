import 'package:flutter/material.dart';

import 'package:not_another_weather_app/models/city_weather_model.dart';

class PreviusCity extends StatelessWidget {
  const PreviusCity({
    Key? key,
    required this.oldCityWeather,
  }) : super(key: key);

  final CityWeather oldCityWeather;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Previus City ',
        style: Theme.of(context).textTheme.headline6,
      ),
      const SizedBox(height: 20.0),
      Text(
        '${oldCityWeather.name}  ${oldCityWeather.main.temp.toString()}',
        style: Theme.of(context).textTheme.headline5,
      ),
    ]);
  }
}
