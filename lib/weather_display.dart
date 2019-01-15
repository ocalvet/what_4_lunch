import 'package:flutter/material.dart';
import 'package:what_4_lunch/weather.dart';
import 'package:what_4_lunch/weather_service.dart';
import 'package:location/location.dart';

class WeatherDisplay extends StatefulWidget {
  @override
  _WeatherDisplayState createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  double temp;
  var currentLocation = <String, double>{};
  var location = Location();
  @override
  void initState() {
    location.getLocation().then((Map<String, double> location) {
      print(location);
      return weatherService.getByLatLon(Coord(
        lat: location["latitude"],
        lon: location["longitude"],
      ));
    }).then((Weather weatherData) => setState(() {
          temp = weatherData.main.temp;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Temp: $temp°');
  }
}
