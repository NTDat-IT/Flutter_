import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AssestCustom {
  static String getLinkImg(String nameImg) =>
      'assets/images/weathers/${nameImg.replaceAll(' ', '').toLowerCase()}.png';
}

class Mykey {
  static String ApiKey = '6235e14d297c85c75703c1a7147c3152';
  static String ApiCity = 'HaNoi';
}

class FormatData {
  static String FormatDay(String day) {
    DateTime date = DateTime.parse(day);
    String formatDate = DateFormat('EEEE').format(date);
    return formatDate;
  }

  static String FormatTime(String time) {
    DateTime Time = DateTime.parse(time);
    String formatTime = DateFormat('HH:MM').format(Time);
    return formatTime;
  }
}

Widget createTemp(num nhietdo, {double size = 100}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        nhietdo.toString(),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        "o",
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.4,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
