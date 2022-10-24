import 'package:flutter/material.dart';
import 'package:not_another_weather_app/ui/screens/game_screen.dart';

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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('Welcome to the weather game'),
              ),
              ElevatedButton(
                onPressed: () {
                  //TODO: implement navigation
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(),
                    ),
                  );
                },
                child: Text('START GAME'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
