import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_appdemo/apps/config/theme_custom.dart';
import 'package:weather_appdemo/page/bottom_navigation/bottom_navigation_custom.dart';

import 'package:provider/provider.dart';
import 'package:weather_appdemo/providers/weather_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MaterialApp(
        theme: TheCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: const BottomCustom(),
      ),
    );
  }
}
