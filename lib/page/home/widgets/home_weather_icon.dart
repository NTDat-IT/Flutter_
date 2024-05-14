import 'package:flutter/material.dart';

import '../../../apps/untils/const.dart';

class HomeWeatherIcon extends StatelessWidget {
  HomeWeatherIcon({super.key, required this.nameIcon});

  String nameIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 2,
      padding: const EdgeInsets.all(30),
      child: Image.asset(
        AssestCustom.getLinkImg(nameIcon),
        fit: BoxFit.cover, // không làm nhòe ảnh
      ),
    );
  }
}
