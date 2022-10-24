import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:not_another_weather_app/ui/widgets/new_city.dart';
import 'package:not_another_weather_app/ui/widgets/game_score.dart';
import 'package:not_another_weather_app/ui/widgets/previus_city.dart';
import 'package:not_another_weather_app/providers/game_provider.dart';
import 'package:not_another_weather_app/ui/widgets/display_failure.dart';
import 'package:not_another_weather_app/ui/widgets/buttons_cold_warm.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Another Weather App')),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Consumer<GameProvider>(
                  builder: (context, gameProvider, child) {
                    if (gameProvider.newCityWeather.id != 0) {
                      if (gameProvider.oldCityWeather.id != 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PreviusCity(
                                oldCityWeather: gameProvider.oldCityWeather),
                            SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  NewCity(
                                      newCityWeather:
                                          gameProvider.newCityWeather),
                                  AnimatedOpacity(
                                    opacity: gameProvider.showSuccessAnimation
                                        ? 1.0
                                        : 0.0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Container(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      child: Center(
                                        child: Column(
                                          children: const [
                                            Icon(
                                              Icons.tag_faces,
                                              size: 150,
                                              color: Colors.green,
                                            ),
                                            Text('Correct Answer!!!')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                    // TODO: poner loading? POngo gif ahora cuando esta cargando?
                    // Y sino pongo loading?
                    /* if (gameProvider.state == NotifierState.loaded) {
                      if (gameProvider.newCityWeather.id != 0) {
                        if (gameProvider.oldCityWeather.id != 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PreviusCity(
                                  oldCityWeather: gameProvider.oldCityWeather),
                              NewCity(newCityWeather: gameProvider.newCityWeather),
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
                    } */
                    return Container();
                  },
                ),
              ),
              const ButtonsColdWarm(),
            ],
          ),
        ],
      ),
    );
  }
}
