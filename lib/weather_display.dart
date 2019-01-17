import 'package:flutter/material.dart';
import 'package:what_4_lunch/bloc.dart';
import 'package:what_4_lunch/bloc_provider.dart';
import 'package:what_4_lunch/weather.dart';
import 'package:location/location.dart';

class WeatherDisplay extends StatelessWidget {
  final currentLocation = <String, double>{};
  final location = Location();
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    location.getLocation().then((Map<String, double> location) {
      print(location);
      bloc.updateWeatherConditions(Coord(
        lat: location["latitude"],
        lon: location["longitude"],
      ));
    });
    return StreamBuilder<Weather>(
      stream: bloc.weather$,
      builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        double temp = snapshot.data.main.temp;
        return Text('Temp: $temp°');
      },
    );
  }
}
