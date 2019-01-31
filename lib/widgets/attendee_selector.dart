import 'package:flutter/material.dart';
import 'package:badge/badge.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/attendee.dart';

class AttendeeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Container(
      child: StreamBuilder<List<AttendeeModel>>(
        stream: bloc.attendees$,
        builder: (BuildContext context, AsyncSnapshot<List<AttendeeModel>> snapshot) {
          if (!snapshot.hasData) return Container();
          return Badge(
            positionTop: -7,
            positionRight: -7,
            color: Colors.green,
            value: snapshot.data.where((a) => a.attending).length.toString(), // value to show inside the badge
            child: RaisedButton.icon(
              icon: Icon(Icons.people),
              onPressed: () {
                Navigator.pushNamed(context, '/attendees');
              },
              label: Text('Attendees'),
            ),
          );
        },
      ),
    );
  }
}
