import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'dart:async';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const apiKey = "d305c456e67f550993197a6ebcc79780";
double lat=0,lon=0;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{
    location locatun = new location();
    await locatun.getCurrentLocation();
    lat = locatun.lattitude;
    lon = locatun.longitude;
    print("latitude is "+ locatun.lattitude.toString());
    print("longitude is "+ locatun.longitude.toString());
    NetworkHelper networkHelper = new NetworkHelper('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){return LocationScreen(locationWeather: weatherData,);}));
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}