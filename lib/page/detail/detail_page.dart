import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/weather.dart';
import '../../providers/weather_provider.dart';
import 'widgets/detail_appbar.dart';
import 'widgets/detail_body.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: FutureBuilder<Object>(
        future: context.read<WeatherProvider>().getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return Container(
              child: const Text('Lỗi dữ liệu'),
            );
          }

          List<WeatherDetail> listDataDetail =
              snapshot.data as List<WeatherDetail>;

          return Scaffold(
            appBar: const DetailAppBar(),
            body: DetailBody(
              listdata: listDataDetail,
            ),
          );
        },
      ),
    );
  }
}
