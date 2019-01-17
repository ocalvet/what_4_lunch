import 'package:flutter/material.dart';

class AttendeeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton.icon(
        icon: Icon(Icons.people),
        onPressed: () {
          Navigator.pushNamed(context, '/attendees');
        }, 
        label: Text('Set Attendees'),
      ),
    );
  }
}