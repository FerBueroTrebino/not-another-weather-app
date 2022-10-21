import 'package:flutter/material.dart';

class DisplayFailure extends StatelessWidget {
  const DisplayFailure({
    Key? key,
    required this.failureMessage,
  }) : super(key: key);

  final String failureMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(failureMessage),
    );
  }
}
