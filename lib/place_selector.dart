import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:what_4_lunch/place.dart';
import 'package:what_4_lunch/place_service.dart';
import 'package:android_intent/android_intent.dart';
import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onPressed: _selectPlace,
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

  _selectPlace() async {
    final snackBar = SnackBar(
      content: Text('Yes, we are going to ${generatedPlace.name}'),
      action: SnackBarAction(
        label: 'Map',
        onPressed: _navigateToPlace,
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _navigateToPlace() async {
    print('One day we will open a map here with directions');
    String origin =
        "901 Penninsula corp drive boca raton fl"; // lat,long like 123.34,68.56
    // String destination="someEndLocationStringAddress or lat,long";
    String destination = '${generatedPlace.name}';
    if (LocalPlatform().isAndroid) {
      final AndroidIntent intent = new AndroidIntent(
          action: 'action_view',
          data: Uri.encodeFull(
              "https://www.google.com/maps/dir/?api=1&origin=" +
                  origin +
                  "&destination=" +
                  destination +
                  "&travelmode=driving&dir_action=navigate"),
          package: 'com.google.android.apps.maps');
      intent.launch();
    } else {
      String url = Uri.encodeFull(
          "https://www.google.com/maps/dir/?api=1&origin=" +
              origin +
              "&destination=" +
              destination +
              "&travelmode=driving&dir_action=navigate");
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
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
    Place randomPlace = await places.getRandomPlace();
    this.setState(() {
      generatedPlace = randomPlace;
    });
  }
}
