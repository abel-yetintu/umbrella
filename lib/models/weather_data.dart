class WeatherData {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherData({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
    );
}

class Location {
  final String name;
  final String country;
  final double lat;
  final double lon;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    country: json["country"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );
}

class Current {
  final double tempC;
  final int isDay;
  final Condition condition;
  final int humidity;
  final double feelslikeC;
  final double visKm;
  final double windKph;

  Current({
        required this.tempC,
        required this.isDay,
        required this.condition,
        required this.humidity,
        required this.feelslikeC,
        required this.visKm,
        required this.windKph,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json["temp_c"],
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        humidity: json["humidity"],
        feelslikeC: json["feelslike_c"]?.toDouble(),
        visKm: json["vis_km"],
        windKph: json["wind_kph"]?.toDouble(),
    );
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );
}

class Forecast {
  final List<Forecastday> forecastday;

  Forecast({
      required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
      forecastday: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
  );
}

class Forecastday {
  final DateTime date;
  final Day day;
  final List<Hour> hour;

  Forecastday({
        required this.date,
        required this.day,
        required this.hour,
    });

    factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
      date: DateTime.parse(json["date"]),
        day: Day.fromJson(json["day"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
    );
}

class Day {
  final double maxtempC;
  final double mintempC;
  final double avgtempC;
  final double maxwindMph;
  final double avghumidity;
  final Condition condition;

  Day({
        required this.maxtempC,
        required this.mintempC,
        required this.avgtempC,
        required this.maxwindMph,
        required this.avghumidity,
        required this.condition,
    });

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        mintempC: json["mintemp_c"]?.toDouble(),
        avgtempC: json["avgtemp_c"]?.toDouble(),
        maxwindMph: json["maxwind_mph"]?.toDouble(),
        avghumidity: json["avghumidity"],
        condition: Condition.fromJson(json["condition"]),
    );

}

class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final Condition condition;

  Hour({
        required this.timeEpoch,
        required this.time,
        required this.tempC,
        required this.condition,
    });

factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"],
        time: json["time"],
        tempC: json["temp_c"]?.toDouble(),
        condition: Condition.fromJson(json["condition"]),
    );

}
