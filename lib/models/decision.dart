import 'package:what_4_lunch/models/place.dart';
import 'package:what_4_lunch/models/weather.dart';

class Decision {
  final DateTime time;
  final int dayOfWeek;
  final List<String> attendees;
  final Duration nextMeetingIn;
  final Weather weather;
  final Place place;
  final bool going;

  Decision({this.time, this.dayOfWeek, this.attendees, this.nextMeetingIn, this.weather, this.place, this.going});

  Decision.fromJson(Map<String, dynamic> json) :
    time = DateTime.parse(json['time']),
    dayOfWeek = json['dayOfWeek'].toInt(),
    attendees = json['attendees'] != null ? json['attendees'].forEach((v) => v.toString()) : null,
    nextMeetingIn = Duration(minutes: json['nextMeetingIn'].toInt()),
    weather = Weather.fromJson(json['weather']),
    place = Place.fromJson(json['place']),
    going = json['going'];

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
    data["going"] = going;
    return data;
  }
}