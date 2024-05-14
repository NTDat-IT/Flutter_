import 'package:flutter/material.dart';
import 'package:weather_appdemo/page/my_app.dart';
import 'package:geolocator/geolocator.dart';

// Future<String> _getCurrentCity() async {
//   try {
//     Position position = await _determinePosition();
//     List<Location> placemarks = await Geolocator.placemarkFromCoordinates(
//         position.latitude, position.longitude);
//     return placemarks.isNotEmpty
//         ? placemarks[0].locality ?? 'Unknown'
//         : 'Unknown'; // Xử lý trường hợp danh sách placemarks rỗng
//   } catch (e) {
//     print("Error getting current city: $e");
//     return 'Unknown';
//   }
// }

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      throw Exception('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // String currentCity = await _getCurrentCity();

  runApp(
    const MyApp(),
  );
}
