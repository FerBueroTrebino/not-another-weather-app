import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:not_another_weather_app/providers/game_provider.dart';

class ButtonsColdWarm extends StatelessWidget {
  const ButtonsColdWarm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: 20.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                context.read<GameProvider>().evaluateUserAnswer(true),
            child: const Text('Colder'),
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                context.read<GameProvider>().evaluateUserAnswer(false),
            child: const Text('Warmer'),
          ),
        ),
        const SizedBox(width: 20.0),
      ],
    );
  }
}
