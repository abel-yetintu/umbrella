import 'package:flutter/material.dart';
import 'package:umbrella/models/weather_data.dart';
import 'package:umbrella/services/api_exceptions.dart';
import 'package:umbrella/services/weather_api.dart';

class WeatherDataProvider extends ChangeNotifier {
  WeatherData? _weatherData;
  WeatherData? get weatherData => _weatherData;

  ApiExceptions? _apiException;
  ApiExceptions? get apiException => _apiException;
  void setApiException(ApiExceptions apiException) {
    _apiException = apiException;
    isLoading = false;
    notifyListeners();
  }

  bool isLoading = true;
  final WeatherApi _weatherApi = WeatherApi();

  Future<void> getForecastByCity(String city) async {
    isLoading = true;
    notifyListeners();

    try {
      final weatherData = await _weatherApi.getForecastbyCity(city: city);
      _weatherData = weatherData;
      _apiException = null;
    } on ApiExceptions catch (e) {
      _apiException = e;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> getForecastByLocation(String location) async {
    await Future.delayed(const Duration(seconds: 1));
    isLoading = true;
    notifyListeners();

    try {
      final weatherData =
          await _weatherApi.getForecastbyLocation(geoLocation: location);
      _weatherData = weatherData;
      _apiException = null;
    } on ApiExceptions catch (e) {
      _apiException = e;
    }

    isLoading = false;
    notifyListeners();
  }
}
