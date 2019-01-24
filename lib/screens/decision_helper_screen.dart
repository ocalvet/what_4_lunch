import 'package:flutter/material.dart';
import 'package:what_4_lunch/widgets/attendee_selector.dart';
import 'package:what_4_lunch/widgets/next_meeting_selection.dart';
import 'package:what_4_lunch/widgets/place_selector.dart';
import 'package:what_4_lunch/widgets/weather_display.dart';

class DecisionHelperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
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
              PlaceSelector(),
            ],
          ),
        ],
      ),
    );
  }
}
