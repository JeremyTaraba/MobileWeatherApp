import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

import 'package:klimate/services/weather.dart';

// import 'package:location/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // Future<bool> checkIfLocationOn() async {
  //   Location location = Location();
  //   bool ison = await location.serviceEnabled();
  //   if (!ison) {
  //     //if device is off
  //     bool isturnedon = await location.requestService();
  //     if (isturnedon) {
  //       print("GPS device is turned ON");
  //       return true;
  //     } else {
  //       print("GPS Device is still OFF");
  //       return false;
  //     }
  //   }
  //   return false;
  // }

  void getLocationData() async {
    var weatherData = await getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF5A945B),
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
