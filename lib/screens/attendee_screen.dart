import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';

class AttendeeScreen extends StatelessWidget {
  final List<String> attendees = ["Ovidio", "Jeff"];
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Attendees'),
      ),
      body: ListView.builder(
        itemCount: attendees.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(attendees[index]),
          );
        },
      ),
    );
  }
}
