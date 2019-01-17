import 'package:location/location.dart';
import 'package:what_4_lunch/api/decision_service.dart';
import 'package:what_4_lunch/blocs/bloc_base.dart';
import 'package:what_4_lunch/models/attendee.dart';
import 'package:what_4_lunch/models/decision.dart';
import 'package:what_4_lunch/models/place.dart';
import 'package:rxdart/rxdart.dart';
import 'package:what_4_lunch/api/place_service.dart';
import 'package:what_4_lunch/models/weather.dart';
import 'package:what_4_lunch/api/weather_service.dart';

class ApplicationBloc extends BlocBase {
  final WeatherService weatherService;
  final PlaceService placeService;
  final DecisionService decisionService;
  final location = Location();
  ApplicationBloc({this.weatherService, this.placeService, this.decisionService});
  // Place
  BehaviorSubject<Place> _randomPlaceSubject = BehaviorSubject<Place>();
  Stream<Place> get place$ => _randomPlaceSubject.stream;
  Sink<Place> get _randomPlace => _randomPlaceSubject.sink;
  // Weather
  BehaviorSubject<Weather> _weatherSubject = BehaviorSubject<Weather>();
  Stream<Weather> get weather$ => _weatherSubject.stream;
  Sink<Weather> get _weatherCondition => _weatherSubject.sink;
  // Decision
  BehaviorSubject<Decision> _decisionSubject = BehaviorSubject<Decision>();
  Stream<Decision> get decision$ => _decisionSubject.stream;
  // Next Meeting In
  BehaviorSubject<Duration> _nextMeetingSubject = BehaviorSubject<Duration>();
  Stream<Duration> get nextMeeting$ => _nextMeetingSubject.stream;
  Sink<Duration> get _nextMeeting => _nextMeetingSubject.sink;
  // Attendees
  BehaviorSubject<List<Attendee>> _attendeesSubject = BehaviorSubject<List<Attendee>>(seedValue: [
    Attendee(name: "John", attending: true),
    Attendee(name: "Jeff", attending: true),
    Attendee(name: "Ovidio", attending: true),
    Attendee(name: "Carlos", attending: true),
    Attendee(name: "Faisal", attending: true),
    Attendee(name: "Mike", attending: true),
    Attendee(name: "Danny", attending: false),
    Attendee(name: "Yohay", attending: false),
    Attendee(name: "Steven", attending: false),
  ]);
  Stream<List<Attendee>> get attendees$ => _attendeesSubject.stream;
  Sink<List<Attendee>> get _attendees => _attendeesSubject.sink;

  getRandomPlace() async {
    Place randomPlace = await placeService.getRandomPlace();
    _randomPlace.add(randomPlace);
  }

  updateWeatherConditions() async {
    Map<String, double> l = await location.getLocation();
    print(l);
    Weather weather = await weatherService.getByLatLon(Coord(
      lat: l["latitude"],
      lon: l["longitude"],
    ));
    _weatherCondition.add(weather);
  }

  addAttendee(Attendee attendee) async {
    print('adding $attendee');
    List<Attendee> selectedAttendees = await _attendeesSubject.last;
    selectedAttendees.add(attendee);
    _attendees.add(List.from(selectedAttendees));
  }

  removeAttendee(Attendee attendee) async {
    print('removing $attendee');
    List<Attendee> selectedAttendees = await _attendeesSubject.last;
    selectedAttendees.removeWhere((a) => a.name == attendee.name);
    _attendees.add(List.from(selectedAttendees));
  }

  updateNextMeeting(Duration nextMeetingIn) {
    _nextMeeting.add(nextMeetingIn);
  }

  makeDecision(bool going) async {
    Place place = await _randomPlaceSubject.last;
    Weather weather = await _weatherSubject.last;
    Duration nextMeeting = await _nextMeetingSubject.last;
    List<Attendee> attendees = await _attendeesSubject.last;
    DateTime date = DateTime.now();
    Decision decision = Decision(
      place: place,
      weather: weather,
      time: date,
      dayOfWeek: date.weekday,
      nextMeetingIn: nextMeeting,
      attendees: attendees.where((a) => a.attending).map((a) => a.name),
      going: going,
    );
    try {
      await decisionService.createDecision(decision);
    } catch (e) {
      print(e.toString());
      _decisionSubject.addError(e);
    }
  }

  @override
  dispose() {
    _randomPlaceSubject.close();
    _weatherSubject.close();
    _decisionSubject.close();
    _attendeesSubject.close();
    _nextMeetingSubject.close();
  }
}
