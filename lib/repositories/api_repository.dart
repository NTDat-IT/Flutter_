import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weather_appdemo/apps/untils/const.dart';
import 'package:weather_appdemo/models/weather.dart';
import 'package:weather_appdemo/page/my_app.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?q=${Mykey.ApiCity}&units=metric&appid=${Mykey.ApiKey}');
      // gọi api về
      final data = res.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<List<WeatherDetail>> callApiGetDetailWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?q=${Mykey.ApiCity}&units=metric&appid=${Mykey.ApiKey}');
      // gọi api về

      List data = res.data['list'];
      List<WeatherDetail> result = List<WeatherDetail>.from(
          data.map((e) => WeatherDetail.fromMap(e)).toList());
      print('123');
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}




// 