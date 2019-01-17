import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/screens/home_screen.dart';
import 'package:what_4_lunch/api/place_service.dart';
import 'package:what_4_lunch/api/weather_service.dart';

class What4LunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherService weatherService = WeatherService();
    PlaceService placeService = PlaceService();
    ApplicationBloc bloc = ApplicationBloc(
      weatherService: weatherService,
      placeService: placeService,
    );
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'What4Lunch',
        routes: {
          '/': (context) => HomeScreen(),
        },
        initialRoute: '/',
      ),
      bloc: bloc,
    );
  }
}
