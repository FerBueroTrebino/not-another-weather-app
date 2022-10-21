import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:not_another_weather_app/ui/widgets/new_city.dart';
import 'package:not_another_weather_app/ui/widgets/game_score.dart';
import 'package:not_another_weather_app/ui/widgets/previus_city.dart';
import 'package:not_another_weather_app/providers/game_provider.dart';
import 'package:not_another_weather_app/ui/widgets/display_failure.dart';
import 'package:not_another_weather_app/ui/widgets/buttons_cold_warm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Another Weather App')),
      body: Column(
        children: [
          Expanded(
            child: Consumer<GameProvider>(
              builder: (context, gameProvider, child) {
                if (gameProvider.state == NotifierState.loaded) {
                  if (gameProvider.newCityWeather.id != 0) {
                    if (gameProvider.oldCityWeather.id != 0) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PreviusCity(
                              oldCityWeather: gameProvider.oldCityWeather),
                          const SizedBox(height: 20.0),
                          const Divider(),
                          const SizedBox(height: 80.0),
                          NewCity(newCityWeather: gameProvider.newCityWeather),
                          const SizedBox(height: 20.0),
                          GameScore(score: gameProvider.game.score),
                        ],
                      );
                    } else {
                      return NewCity(
                          newCityWeather: gameProvider.newCityWeather);
                    }
                  } else if (gameProvider.failure != null) {
                    return DisplayFailure(
                        failureMessage: gameProvider.failure!.message);
                  }
                } else if ((gameProvider.state == NotifierState.loading)) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if ((gameProvider.state == NotifierState.initial)) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ),
          const ButtonsColdWarm(),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
