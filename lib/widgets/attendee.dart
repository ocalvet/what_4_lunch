import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';
import 'package:what_4_lunch/models/attendee.dart';

class Attendee extends StatelessWidget {
  final AttendeeModel attendee;

  const Attendee({Key key, this.attendee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return ListTile(
      onTap: null,
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.person_outline),
      ),
      title: Row(
        children: [
          Expanded(child: Text(attendee.name)),
          Checkbox(
            value: attendee.attending,
            onChanged: (bool value) => bloc.updateAttendee(
                  AttendeeModel(
                    name: attendee.name,
                    attending: value,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
