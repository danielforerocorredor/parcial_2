/*
{
  "weather": [
    {
      "description": "clear sky",
    }
  ],
  "main": {
    "temp": 282.55,
    "humidity": 100
  },
  "wind": {
    "speed": 1.5,
  },
  "name": "Mountain View",
}   
*/
class WeatherInfo {
  final String description;

  WeatherInfo({required this.description});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(description: json['description']);
  }
}

class TempInfo {
  final double temperature;
  final double humidity;

  TempInfo({required this.temperature, required this.humidity});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    return TempInfo(temperature: json['temp'], humidity: json['humidity']);
  }
}

class WindInfo {
  final double windSpeed;

  WindInfo({required this.windSpeed});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    return WindInfo(windSpeed: json['speed']);
  }
}

class Response {
  final String cityName; //name
  final TempInfo mainInfo; //temp and humidity
  final WeatherInfo weatherInfo; // description
  final WindInfo windInfo; // wind speer

  Response(
      {required this.cityName,
      required this.mainInfo,
      required this.weatherInfo,
      required this.windInfo});

  factory Response.fromJson(Map<String, dynamic> json) {
    // Name
    final cityName = json['name'];

    // Main info
    final mainInfoJson = json['main'];
    final mainInfo = TempInfo.fromJson(mainInfoJson);

    // weatherInfo
    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    // windInfo
    final windInfoJson = json['wind'];
    final windInfo = WindInfo.fromJson(windInfoJson);

    return Response(
        cityName: cityName,
        mainInfo: mainInfo,
        weatherInfo: weatherInfo,
        windInfo: windInfo);
  }
}
