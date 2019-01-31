import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/attendee.dart';
import 'package:what_4_lunch/widgets/attendee.dart';

class AttendeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Attendees'),
      ),
      body: StreamBuilder<List<AttendeeModel>>(
        stream: bloc.attendees$,
        builder:
            (BuildContext context, AsyncSnapshot<List<AttendeeModel>> snapshot) {
          List<AttendeeModel> attendees = snapshot.hasData ? snapshot.data : [];
          print('Total Attendees ${attendees.length}');
          return ListView.builder(
            itemCount: attendees.length,
            itemBuilder: (BuildContext context, int index) {
              return Attendee(attendee: attendees[index]);
            },
          );
        },
      ),
    );
  }
}
