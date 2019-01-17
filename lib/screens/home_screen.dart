import 'package:flutter/material.dart';
import 'package:what_4_lunch/widgets/place_selector.dart';
import 'package:what_4_lunch/widgets/weather_display.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
      ),
      body: Stack(
        children: [
          Positioned(
            child: WeatherDisplay(),
            top: 10,
            right: 10,
          ),
          PlaceSelector(),
        ],
      ),
    );
  }
}
