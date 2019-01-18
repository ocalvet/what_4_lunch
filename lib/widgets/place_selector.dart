import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
// import 'package:vibration/vibration.dart';
import 'package:what_4_lunch/models/place.dart';
import 'package:android_intent/android_intent.dart';
import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return StreamBuilder<Place>(
      stream: bloc.place$,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Place generatedPlace = snapshot.data;
        String textToShow =
            snapshot.hasData ? generatedPlace.name : 'Tab the screen';
        String textSecond =
            snapshot.hasData ? generatedPlace.name : 'to generate a Place';
        List<Widget> widgets = <Widget>[_bigText(textToShow, context)];
        if (textToShow != textSecond) {
          widgets.add(_bigText(textSecond, context));
        } else {
          widgets.add(Padding(
            padding: EdgeInsets.only(top: 10),
          ));
          widgets.add(_upDown(context, generatedPlace, bloc));
        }
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
          ),
          onTap: () => bloc.getRandomPlace(),
        );
      },
    );
  }

  Widget _upDown(
      BuildContext context, Place generatedPlace, ApplicationBloc bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          iconSize: 64,
          color: Colors.green,
          icon: Icon(Icons.thumb_up),
          onPressed: () => _selectPlace(generatedPlace, context, bloc),
        ),
        IconButton(
          iconSize: 64,
          color: Colors.red,
          icon: Icon(Icons.thumb_down),
          onPressed: () => _rejectPlace(bloc),
        )
      ],
    );
  }

  _rejectPlace(ApplicationBloc bloc) async {
    bloc.makeDecision(false);
    bloc.getRandomPlace();
  }

  _selectPlace(Place generatedPlace, BuildContext context, ApplicationBloc bloc) async {
    bloc.makeDecision(true);
    final snackBar = SnackBar(
      content: Text('Yes, we are going to ${generatedPlace.name}'),
      action: SnackBarAction(
        label: 'Map',
        onPressed: () => _navigateToPlace(generatedPlace),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _navigateToPlace(Place generatedPlace) async {
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
}
