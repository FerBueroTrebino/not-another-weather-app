enum Units { metric, imperial }

const String apiKey = '2bae4d5b768bdd1a675211939eaeb313';

const String apiUrl = 'https://api.openweathermap.org/data/2.5/';

extension ParseToString on Units {
  String toShortString() {
    return toString().split('.').last;
  }
}
