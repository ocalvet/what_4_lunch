import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:what_4_lunch/place.dart';
import 'package:what_4_lunch/places.dart';

class PlaceSelector extends StatefulWidget {
  @override
  _PlaceSelectorState createState() => _PlaceSelectorState();
}

class _PlaceSelectorState extends State<PlaceSelector> {
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
      widgets.add(_upDown(context));
    }
    return GestureDetector(
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
      );
  }

  Widget _upDown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          iconSize: 64,
          color: Colors.green,
          icon: Icon(Icons.thumb_up),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Yes, we are going to ${generatedPlace.name}'),
              action: SnackBarAction(
                label: 'Map',
                onPressed: () {
                  print('One day we will open a map here with directions');
                },
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
        IconButton(
          iconSize: 64,
          color: Colors.red,
          icon: Icon(Icons.thumb_down),
          onPressed: () {
            _generateRandomPlace();
          },
        )
      ],
    );
  }

  Widget _bigText(String text, BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
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