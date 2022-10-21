enum Units { metric, imperial }

const String apiKey = '';

const String apiUrl = 'https://api.openweathermap.org/data/2.5/';

extension ParseToString on Units {
  String toShortString() {
    return toString().split('.').last;
  }
}
