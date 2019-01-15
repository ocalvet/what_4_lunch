import 'package:flutter/material.dart';
import 'package:what_4_lunch/weather.dart';
import 'package:what_4_lunch/weather_service.dart';

class WeatherDisplay extends StatefulWidget {
  @override
  _WeatherDisplayState createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  double temp;
  @override
  void initState() {
    weatherService.getByZip(33486).then((Weather weatherData) => setState(() {
      temp = weatherData.main.temp;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Temp: $temp°');
  }
}
