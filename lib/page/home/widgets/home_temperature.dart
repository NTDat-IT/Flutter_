import 'package:flutter/material.dart';
import 'package:weather_appdemo/apps/untils/const.dart';

class HomeTemperature extends StatelessWidget {
  HomeTemperature({super.key, required this.nhietdo});

  num nhietdo;

  @override
  Widget build(BuildContext context) {
    return createTemp(nhietdo.toInt());
  }
}
