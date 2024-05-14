import 'package:flutter/material.dart';
import 'package:weather_appdemo/page/detail/widgets/detail_appbar.dart';

class HomeLocation extends StatelessWidget {
  const HomeLocation({
    super.key,
  });

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                "assets/images/icons/location.png",
                fit: BoxFit.cover,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              '$cityName City',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            )
          ],
        ),
        Text(
          getCurrentDate(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        )
      ],
    );
  }
}
