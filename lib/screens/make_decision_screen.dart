import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/place.dart';
import 'package:what_4_lunch/widgets/attendee_selector.dart';
import 'package:what_4_lunch/widgets/next_meeting_selection.dart';
import 'package:what_4_lunch/widgets/weather_display.dart';

class MakeDecisionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.getPlaces();
    return Scaffold(
      appBar: AppBar(
        title: Text('Decision'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: WeatherDisplay(),
            top: 10,
            right: 10,
          ),
          Positioned(
            left: 20,
            top: 25,
            child: NextMeetingSelection(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AttendeeSelector(),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              StreamBuilder<List<Place>>(
                stream: bloc.places$,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Place>> snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return PlaceDropDown(places: snapshot.data);
                },
              ),
            ],
          ),
          Positioned(
            child: RaisedButton(
              child: Text('Decide'),
              onPressed: () {
                bloc.makeDecision(true);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Decision made'),
                  backgroundColor: Colors.green,
                ));
              },
            ),
            left: 20,
            bottom: 20,
          )
        ],
      ),
    );
  }
}

class PlaceDropDown extends StatelessWidget {
  final List<Place> places;
  const PlaceDropDown({Key key, this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return DropdownButton(
      items: places.where((p) => p.name != null).map((p) {
        return DropdownMenuItem(
          child: Text(p.name),
          value: p,
        );
      }).toList(),
      value: places[0],
      onChanged: (Place value) {
        bloc.selectPlace(value);
      },
    );
  }
}
