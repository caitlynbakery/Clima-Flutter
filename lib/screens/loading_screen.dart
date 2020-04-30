import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();

  }


  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  void getData() async {

    //  Example of API call
//
//  api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=414dd026dd189e106e1d77920b3ac0f9
//
//  APPID
//  414dd026dd189e106e1d77920b3ac0f9

    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');

    if (response.statusCode == 200) {
      String data = response.body;
      
      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      print(temperature);

      int condition = decodedData['weather'][0]['id'];
      print(condition);
      
      String city = decodedData['name'];
      print(city);

    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
