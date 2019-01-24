import 'package:flutter/material.dart';
import 'package:what_4_lunch/api/decision_service.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/screens/attendee_screen.dart';
import 'package:what_4_lunch/screens/decision_helper_screen.dart';
import 'package:what_4_lunch/api/place_service.dart';
import 'package:what_4_lunch/api/weather_service.dart';
import 'package:what_4_lunch/screens/home_screen.dart';

class What4LunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = WeatherService();
    PlaceService placeService = PlaceService();
    DecisionService decisionService = DecisionService();
    ApplicationBloc bloc = ApplicationBloc(
      weatherService,
      placeService,
      decisionService,
    );
    bloc.updateWeatherConditions();
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'What4Lunch',
        theme: ThemeData.dark(),
        routes: {
          '/': (context) => HomeScreen(),
          '/attendees': (context) => AttendeeScreen(),
          '/decision-helper': (context) => DecisionHelperScreen(),
        },
        initialRoute: '/',
      ),
      bloc: bloc,
    );
  }
}
