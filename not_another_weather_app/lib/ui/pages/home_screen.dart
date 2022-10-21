import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:not_another_weather_app/providers/game_provider.dart';

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
                if (gameProvider.weather.id != 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'City ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        gameProvider.weather.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 60.0),
                      Text(
                        'Temperatura: ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        gameProvider.weather.main.temp.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  );
                } else if (gameProvider.failure != null) {
                  return Center(
                    child: Text(gameProvider.failure!.message),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 20.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Lower'),
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Higher'),
                ),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
