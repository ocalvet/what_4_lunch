import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/place.dart';
import 'package:what_4_lunch/widgets/big_text.dart';
import 'package:what_4_lunch/widgets/up_down.dart';

class PlaceSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return StreamBuilder<Place>(
      stream: bloc.place$,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Place generatedPlace = snapshot.data;
        String textToShow =
            snapshot.hasData ? generatedPlace?.name : 'Tab the screen';
        String textSecond =
            snapshot.hasData ? generatedPlace?.name : 'to generate a Place';
        List<Widget> widgets = <Widget>[BigText(text: textToShow)];
        if (textToShow != textSecond) {
          widgets.add(BigText(text: textSecond));
        } else {
          widgets.add(Padding(
            padding: EdgeInsets.only(top: 10),
          ));
          widgets.add(UpDown(place: generatedPlace,));
        }
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widgets,
            ),
          ),
          onTap: () => bloc.getRandomPlace(),
        );
      },
    );
  }
}
