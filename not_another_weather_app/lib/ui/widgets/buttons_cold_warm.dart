import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:not_another_weather_app/providers/game_provider.dart';

class ButtonsColdWarm extends StatelessWidget {
  const ButtonsColdWarm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 20.0),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                bool isCorrect =
                    context.read<GameProvider>().evaluateUserAnswer(true);
                if (!isCorrect) {
                  // TODO: cuadro de dialogo
                  // Ingrsar nombre + resto de score
                  // showModalCorrect(context);
                  Navigator.pop(context);
                }
              },
              child: const Text('Colder'),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                bool isCorrect =
                    context.read<GameProvider>().evaluateUserAnswer(false);

                if (!isCorrect) {
                  // TODO: cuadro de dialogo
                  // Ingrsar nombre + resto de score
                  // showModalCorrect(context);
                  Navigator.pop(context);
                }
              },
              child: const Text('Warmer'),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
