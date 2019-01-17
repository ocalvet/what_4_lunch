import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/attendee.dart';

class AttendeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Attendees'),
        ),
        body: StreamBuilder<List<Attendee>>(
          stream: bloc.attendees$,
          initialData: [],
          builder:
              (BuildContext context, AsyncSnapshot<List<Attendee>> snapshot) {
            List<Attendee> attendees = snapshot.data;
            print(attendees);
            return ListView.builder(
              itemCount: attendees.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    onTap: null,
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person_outline),
                    ),
                    title: Row(
                      children: [
                        Expanded(child: Text(attendees[index].name)),
                        Checkbox(
                            value: attendees[index].attending,
                            onChanged: (bool value) => value
                                ? bloc.addAttendee(attendees[index])
                                : bloc.removeAttendee(attendees[index]))
                      ],
                    ));
              },
            );
          },
        ));
  }
}
