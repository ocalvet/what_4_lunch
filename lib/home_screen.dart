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
    List<Widget> widgets = <Widget>[_bigText(textToShow, context)];
    if (textToShow != textSecond) {
      widgets.add(_bigText(textSecond, context));
    } else {
      widgets.add(Padding(
        padding: EdgeInsets.only(top: 10),
      ));
      widgets.add(_upDown());
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

  Widget _upDown() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            iconSize: 64,
            color: Colors.green,
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 64,
            color: Colors.red,
            icon: Icon(Icons.thumb_down),
            onPressed: () {},
          )
        ],
      );
  }

  Widget _bigText(String text, BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Text(text,
          style: textStyle,
          textAlign: TextAlign.center,);
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
