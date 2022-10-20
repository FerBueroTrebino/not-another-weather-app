import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Another Weather App')),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'City Name',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '28',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 20.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Lower'),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Higher'),
                ),
              ),
              SizedBox(width: 20.0),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
