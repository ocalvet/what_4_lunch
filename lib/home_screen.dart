import 'package:flutter/material.dart';
import 'package:what_4_lunch/place.dart';
import 'package:what_4_lunch/places.dart';
import 'package:vibration/vibration.dart';

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
    String textToShow = generatedPlace?.name ?? 'Tab the screen';
    String textSecond = generatedPlace?.name ?? 'to generate a Place';
    List<Widget> widgets = <Widget>[
      Text(textToShow,
          style: Theme.of(context).textTheme.display1,
          textAlign: TextAlign.center),
    ];
    if (textToShow != textSecond) {
      widgets.add(
        Text(textSecond,
            style: Theme.of(context).textTheme.display1,
            textAlign: TextAlign.center),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
      ),
      body: GestureDetector(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: widgets,
              ),
            ),
          ),
        ),
        onTap: _generateRandomPlace,
      ),
    );
  }

  _generateRandomPlace() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 500);
    }
    this.setState(() {
      generatedPlace = places.getRandomPlace();
    });
  }
}
