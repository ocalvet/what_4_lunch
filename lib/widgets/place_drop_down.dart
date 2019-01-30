import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/place.dart';

class PlaceDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return StreamBuilder(
      stream: bloc.places$,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        List<Place> places = snapshot.data;
        return StreamBuilder(
          stream: bloc.place$,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              bloc.selectPlace(places.first);
              return CircularProgressIndicator();
            }
            Place selected = snapshot.data;
            return DropdownButton<Place>(
              items: places.where((p) => p.name != null).map((p) {
                return DropdownMenuItem(
                  child: Text(p.name),
                  value: p,
                );
              }).toList(),
              value: selected,
              onChanged: (Place value) {
                bloc.selectPlace(value);
              },
            );
          },
        );
      },
    );
  }
}
