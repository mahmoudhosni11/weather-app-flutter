import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  int? weatherCode;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    this.weatherCode,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: DateTime.parse(data['current']['last_updated']),
      temp: jsonData['avgtemp_c'].toDouble(),
      maxTemp: jsonData['maxtemp_c'].toDouble(),
      minTemp: jsonData['mintemp_c'].toDouble(),
      weatherStateName: jsonData['condition']['text'],
      weatherCode: jsonData['condition']['code'],
    );
  }

  @override
  String toString() {
    return 'tem = $temp  minTemp = $minTemp  date = $date';
  }

  String getWeatherCategory() {
    String s = weatherStateName.toLowerCase();

    if (s.contains('sunny') || s.contains('clear')) {
      return 'sunny';
    } else if (s.contains('partly cloudy')) {
      return 'partly_cloudy';
    } else if (s.contains('cloudy') || s.contains('overcast')) {
      return 'cloudy';
    } else if (s.contains('mist') || s.contains('fog')) {
      return 'foggy';
    } else if (s.contains('rain') || s.contains('drizzle') || s.contains('shower')) {
      return 'rainy';
    } else if (s.contains('snow') || s.contains('sleet') || s.contains('blizzard') || s.contains('ice')) {
      return 'snowy';
    } else if (s.contains('thunder')) {
      return 'thunderstorm';
    } else {
      return 'sunny';
    }
  }

  String getImage() {
    switch (getWeatherCategory()) {
      case 'sunny':
      case 'partly_cloudy':
        return 'assets/images/clear.png';
      case 'cloudy':
      case 'foggy':
        return 'assets/images/cloudy.png';
      case 'rainy':
        return 'assets/images/rainy.png';
      case 'snowy':
        return 'assets/images/snow.png';
      case 'thunderstorm':
        return 'assets/images/thunderstorm.png';
      default:
        return 'assets/images/clear.png';
    }
  }

  IconData getWeatherIcon() {
    switch (getWeatherCategory()) {
      case 'sunny':
        return Icons.wb_sunny_rounded;
      case 'partly_cloudy':
        return Icons.wb_cloudy;
      case 'cloudy':
        return Icons.cloud;
      case 'foggy':
        return Icons.foggy;
      case 'rainy':
        return Icons.water_drop;
      case 'snowy':
        return Icons.ac_unit_rounded;
      case 'thunderstorm':
        return Icons.thunderstorm;
      default:
        return Icons.wb_sunny_rounded;
    }
  }

  List<Color> getGradientColors() {
    switch (getWeatherCategory()) {
      case 'sunny':
        return [
          const Color(0xFFFF8008),
          const Color(0xFFFFC837),
          const Color(0xFFFFF176),
        ];
      case 'partly_cloudy':
        return [
          const Color(0xFF4CA1AF),
          const Color(0xFF85C1E9),
          const Color(0xFFD5F5E3),
        ];
      case 'cloudy':
        return [
          const Color(0xFF616161),
          const Color(0xFF9E9E9E),
          const Color(0xFFBDBDBD),
        ];
      case 'foggy':
        return [
          const Color(0xFF536976),
          const Color(0xFF8BA4B5),
          const Color(0xFFBBD2C5),
        ];
      case 'rainy':
        return [
          const Color(0xFF0F2027),
          const Color(0xFF203A43),
          const Color(0xFF2C5364),
        ];
      case 'snowy':
        return [
          const Color(0xFFE6DADA),
          const Color(0xFF8EC5FC),
          const Color(0xFFE0C3FC),
        ];
      case 'thunderstorm':
        return [
          const Color(0xFF0F0C29),
          const Color(0xFF302B63),
          const Color(0xFF24243E),
        ];
      default:
        return [
          const Color(0xFF2196F3),
          const Color(0xFF64B5F6),
          const Color(0xFFBBDEFB),
        ];
    }
  }

  MaterialColor getThemeColor() {
    switch (getWeatherCategory()) {
      case 'sunny':
      case 'partly_cloudy':
        return Colors.orange;
      case 'cloudy':
      case 'foggy':
        return Colors.blueGrey;
      case 'rainy':
        return Colors.blue;
      case 'snowy':
        return Colors.lightBlue;
      case 'thunderstorm':
        return Colors.deepPurple;
      default:
        return Colors.orange;
    }
  }

  Color getIconColor() {
    switch (getWeatherCategory()) {
      case 'sunny':
        return const Color(0xFFFFD600);
      case 'partly_cloudy':
        return const Color(0xFF90CAF9);
      case 'cloudy':
        return const Color(0xFFB0BEC5);
      case 'foggy':
        return const Color(0xFF90A4AE);
      case 'rainy':
        return const Color(0xFF42A5F5);
      case 'snowy':
        return Colors.white;
      case 'thunderstorm':
        return const Color(0xFFFFD600);
      default:
        return const Color(0xFFFFD600);
    }
  }
}
