import 'package:what_4_lunch/place.dart';
import 'package:what_4_lunch/weather.dart';

class Decision {
  final DateTime time;
  final String dayOfWeek;
  final List<String> attendees;
  final Duration nextMeetingIn;
  final Weather weather;
  final Place place;

  Decision({this.time, this.dayOfWeek, this.attendees, this.nextMeetingIn, this.weather, this.place});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = time;
    data['dayOfWeek'] = dayOfWeek;
    if (this.attendees != null) {
      data['attendees'] = attendees.map((v) => v.toString());
    }
    data["nextMeetingIn"] = nextMeetingIn.inMinutes;
    data["weather"] = weather.toJson();
    data["place"] = place.toJson();
    return data;
  }
}