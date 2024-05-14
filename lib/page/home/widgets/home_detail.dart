import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({Key? key, required this.doam, required this.tocdogio})
      : super(key: key);

  final num tocdogio;
  final num doam;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SizedBox(
            height: size.height / 10,
            width: 62,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                  width: 62,
                  child: Image.asset(
                    "assets/images/icons/Vector.png",
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${tocdogio.toString()} km/h",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 95,
            width: 62,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                  width: 62,
                  child: Image.asset(
                    "assets/images/icons/humidity.png",
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${doam.toString()}%",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
