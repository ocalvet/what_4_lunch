import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/widgets/attendee_selector.dart';
import 'package:what_4_lunch/widgets/next_meeting_selection.dart';
import 'package:what_4_lunch/widgets/place_drop_down.dart';
import 'package:what_4_lunch/widgets/weather_display.dart';

class DecisionMaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Stack(
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
            PlaceDropDown(),
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
    );
  }
}
