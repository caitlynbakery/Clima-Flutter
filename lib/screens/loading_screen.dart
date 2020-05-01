import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '414dd026dd189e106e1d77920b3ac0f9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();

  }


  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: SpinKitPumpingHeart(
            color: Colors.white,
            size: 100.0,
          ),
        )
    );

  }
}
