import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temp ;
  late int condition ;
  late String cityName;
  var dtm = DateTime.now();
  WeatherModel weatherModel = new WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }
  @override
  void updateUI (dynamic weatherData) {
    temp = weatherData['main']['temp'];
    condition =  weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    print(temp);
    print(condition);
    print(cityName);

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        dtm = DateTime.now();
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  // FlatButton(
                  //   onPressed: () {},
                  //   child: Icon(
                  //     Icons.location_city,
                  //     size: 50.0,
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temp.round().toString()}°',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 130
                      ),
                    ),
                    Text(
                      '${weatherModel.getWeatherIcon(condition)}',
                      style: TextStyle(
                        fontSize: 90
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's ${dtm.hour}:${dtm.minute} time in ${cityName}",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}