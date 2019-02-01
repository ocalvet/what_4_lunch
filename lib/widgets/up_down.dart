import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/place.dart';

class UpDown extends StatelessWidget {
  final Place place;

  const UpDown({Key key, this.place}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          iconSize: 64,
          color: Colors.green,
          icon: Icon(Icons.thumb_up),
          onPressed: () => _selectPlace(place, context, bloc),
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

  _selectPlace(Place place, BuildContext context, ApplicationBloc bloc) async {
    bloc.makeDecision(true);
    final snackBar = SnackBar(
      content: Text('Yes, we are going to ${place.name}'),
      action: SnackBarAction(
        label: 'Map',
        onPressed: () => _navigateToPlace(place),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _navigateToPlace(Place place) async {
    String origin = "901 Penninsula corp drive boca raton fl";
    String destination = '${place.name}';
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
}