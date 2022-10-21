import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    this.coord,
    this.weather,
    this.base = '',
    required this.main,
    this.visibility = 0,
    this.wind,
    this.rain,
    this.clouds,
    this.dt = 0,
    this.sys,
    this.timezone = 0,
    this.id = 0,
    this.name = '',
    this.cod = 0,
  });

  Coord? coord;
  List<WeatherElement>? weather;
  String base;
  Main main;
  int visibility;
  Wind? wind;
  Rain? rain;
  Clouds? clouds;
  int dt;
  Sys? sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coord: Coord.fromJson(json["coord"]),
        weather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElement.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        rain: json["rain"] != null ? Rain.fromJson(json["rain"]) : Rain(),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord != null ? coord!.toJson() : null,
        "weather": weather != null
            ? List<dynamic>.from(weather!.map((x) => x.toJson()))
            : null,
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "dt": dt,
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  Clouds({
    this.all = 0,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord({
    this.lon = 0,
    this.lat = 0,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  Main({
    this.temp = 0,
    this.feelsLike = 0,
    this.tempMin = 0,
    this.tempMax = 0,
    this.pressure = 0,
    this.humidity = 0,
    this.seaLevel = 0,
    this.grndLevel = 0,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble() ?? 0,
        tempMin: json["temp_min"].toDouble() ?? 0,
        tempMax: json["temp_max"].toDouble() ?? 0,
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
        seaLevel: json["sea_level"] ?? 0,
        grndLevel: json["grnd_level"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}

class Rain {
  Rain({
    this.the1H = 0,
  });

  double the1H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"].toDouble() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class Sys {
  Sys({
    this.type = 0,
    this.id = 0,
    this.country = '',
    this.sunrise = 0,
    this.sunset = 0,
  });

  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"] ?? 0,
        id: json["id"] ?? 0,
        country: json["country"] ?? '',
        sunrise: json["sunrise"] ?? '',
        sunset: json["sunset"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class WeatherElement {
  WeatherElement({
    this.id = 0,
    this.main = '',
    this.description = '',
    this.icon = '',
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"] ?? 0,
        main: json["main"] ?? '',
        description: json["description"] ?? '',
        icon: json["icon"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind({
    this.speed = 0,
    this.deg = 0,
    this.gust = 0,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble() ?? 0.0,
        deg: json["deg"] ?? 0,
        gust: json["gust"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
