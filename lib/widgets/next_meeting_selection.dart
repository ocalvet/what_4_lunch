import 'package:flutter/material.dart';
import 'package:what_4_lunch/blocs/bloc.dart';
import 'package:what_4_lunch/blocs/bloc_provider.dart';

class NextMeetingSelection extends StatelessWidget {
  final List<String> nextMeetingMinutes = ["0", "30", "60", "90"];
  @override
  Widget build(BuildContext context) {
    ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    return StreamBuilder<Duration>(
      stream: bloc.nextMeeting$,
      builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Next meeting', style: Theme.of(context).textTheme.subhead,),
            DropdownButton<String>(
              items: nextMeetingMinutes
                  .map((minutes) => DropdownMenuItem<String>(
                        value: minutes,
                        child: Text('in $minutes min'),
                      ))
                  .toList(),
              value: snapshot.data.inMinutes.toString(),
              onChanged: (v) {
                print('selecting $v');
                bloc.updateNextMeeting(Duration(minutes: int.parse(v)));
              },
            ),
          ],
        );
      },
    );
  }
}
