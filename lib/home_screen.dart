import 'package:flutter/material.dart';
import 'package:what_4_lunch/place.dart';
import 'package:what_4_lunch/places.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  Place generatedPlace;

  @override
  Widget build(BuildContext context) {
    String textToShow = generatedPlace?.name ?? 'Tab the screen to generate a Place';
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
      ),
      body: GestureDetector(
        child: Container(
          child: Center(
            child:
                Text(textToShow, style: Theme.of(context).textTheme.display1, textAlign: TextAlign.center),
          ),
        ),
        onTap: _generateRandomPlace,
      ),
    );
  }

  _generateRandomPlace() {
    this.setState(() {
      generatedPlace = places.getRandomPlace();
    });
  }
}
