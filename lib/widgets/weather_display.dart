import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/weather.dart';

class WeatherDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return StreamBuilder<Weather>(
      stream: bloc.weather$,
      builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        double temp = snapshot.data.main.temp;
        return Row(
          children: [
            Text('Temp: $temp°'),
            IconButton(
              icon: Icon(Icons.refresh),
              iconSize: 16,
              onPressed: () => bloc.updateWeatherConditions(),
            ),
          ],
        );
      },
    );
  }
}
