import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'dart:async';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async{
    location locatun = new location();
    await locatun.getCurrentLocation();
    print("latitude is "+ locatun.lattitude.toString());
    print("longitude is "+ locatun.longitude.toString());
  }

  void getData() async{
    Response res = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=23.063063063063062&lon=72.53625439082825&appid=d305c456e67f550993197a6ebcc79780'));
    if(res.statusCode == 200){
      var weather = jsonDecode(res.body)["weather"][0]["description"];
      print(weather);
    }
    else{
      print(res.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
    );
  }
}