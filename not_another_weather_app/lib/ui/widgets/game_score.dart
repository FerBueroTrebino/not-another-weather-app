import 'package:flutter/material.dart';

class GameScore extends StatelessWidget {
  const GameScore({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Text(score.toString());
  }
}
