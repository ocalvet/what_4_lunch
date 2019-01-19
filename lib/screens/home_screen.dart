import 'package:flutter/material.dart';
import 'package:what_4_lunch/widgets/attendee_selector.dart';
import 'package:what_4_lunch/widgets/next_meeting_selection.dart';
import 'package:what_4_lunch/widgets/place_selector.dart';
import 'package:what_4_lunch/widgets/weather_display.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.white70, BlendMode.lighten),
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://cdn0.iconfinder.com/data/icons/food-thinline-icons-set/144/Food_and_Kitchen_Outline_Gyoza-512.png"))),
        child: Stack(
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
      ),
    );
  }
}
