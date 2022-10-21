import 'package:flutter/material.dart';

import 'package:not_another_weather_app/models/city_weather_model.dart';

class NewCity extends StatelessWidget {
  const NewCity({
    Key? key,
    required this.newCityWeather,
  }) : super(key: key);

  final CityWeather newCityWeather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'City ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20.0),
        Text(
          newCityWeather.name,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 60.0),
        Text(
          'Temperatura: ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20.0),
        Text(
          newCityWeather.main.temp.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
