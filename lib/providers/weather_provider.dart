import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_appdemo/models/weather.dart';
import 'package:weather_appdemo/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Position? positionStart;

  updatePosition(Position position) {
    positionStart = position;

    notifyListeners();
  }

  Future<WeatherData> getWeatherCurrent() async {
    WeatherData result = await ApiRepository.callApiGetWeather();
    return result;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> result = await ApiRepository.callApiGetDetailWeather();
    return result;
  }
}
