import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? _cityName;
  bool _isLoading = false;

  WeatherModel? get weatherData => _weatherData;

  String? get cityName => _cityName;

  bool get isLoading => _isLoading;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  set cityName(String? name) {
    _cityName = name;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
