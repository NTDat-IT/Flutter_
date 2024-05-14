import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_appdemo/models/weather.dart';
import 'package:weather_appdemo/page/home/widgets/home_weather_icon.dart';
import 'package:weather_appdemo/providers/weather_provider.dart';

import 'widgets/home_detail.dart';
import 'widgets/home_location.dart';
import 'widgets/home_temperature.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ],
          ),
        ),
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return Container(
                child: const Text("Lỗi dữ liệu"),
              );
            }
            WeatherData data = snapshot.data as WeatherData;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeWeatherIcon(
                  nameIcon: data.weather[0].main,
                ),
                HomeTemperature(nhietdo: data.main.temp),
                const HomeLocation(),
                const SizedBox(
                  height: 40,
                ),
                HomeDetail(
                  tocdogio: data.wind.speed,
                  doam: data.main.humidity,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
