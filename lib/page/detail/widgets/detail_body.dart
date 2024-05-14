import 'package:flutter/material.dart';
import 'package:weather_appdemo/apps/untils/const.dart';

import '../../../models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listdata});
  final List<WeatherDetail> listdata;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          createTemp((listdata[index].main.temp).toInt(),
                              size: 30),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            listdata[index].weather.main,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        FormatData.FormatDay(listdata[index].dt_txt),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 12, 90, 154),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        FormatData.FormatTime(listdata[index].dt_txt),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width / 3,
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    AssestCustom.getLinkImg(listdata[index].weather.main),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          // Separator builder logic goes here
          return const SizedBox(height: 15);
        },
        itemCount: 10,
      ),
    );
  }
}
