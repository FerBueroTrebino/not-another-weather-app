import 'package:flutter/material.dart';

class GameScore extends StatelessWidget {
  const GameScore({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your Score: ${score.toString()}',
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
