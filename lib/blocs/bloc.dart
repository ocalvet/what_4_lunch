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
  final WeatherService _weatherService;
  final PlaceService _placeService;
  final DecisionService _decisionService;
  final location = Location();
  ApplicationBloc(this._weatherService, this._placeService, this._decisionService);
  // Places
  BehaviorSubject<List<Place>> _placesSubject = BehaviorSubject<List<Place>>();
  Stream<List<Place>> get places$ => _placesSubject.stream;
  Sink<List<Place>> get _places => _placesSubject.sink;
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
  BehaviorSubject<Duration> _nextMeetingSubject = BehaviorSubject<Duration>(seedValue: Duration(minutes: 0));
  Stream<Duration> get nextMeeting$ => _nextMeetingSubject.stream;
  Sink<Duration> get _nextMeeting => _nextMeetingSubject.sink;
  // Attendees
  BehaviorSubject<List<AttendeeModel>> _attendeesSubject = BehaviorSubject<List<AttendeeModel>>(seedValue: [
    AttendeeModel(name: "John", attending: true),
    AttendeeModel(name: "Jeff", attending: true),
    AttendeeModel(name: "Ovidio", attending: true),
    AttendeeModel(name: "Carlos", attending: true),
    AttendeeModel(name: "Faisal", attending: true),
    AttendeeModel(name: "Mike", attending: true),
    AttendeeModel(name: "Danny", attending: false),
    AttendeeModel(name: "Yohay", attending: false),
    AttendeeModel(name: "Steven", attending: false),
  ]);
  Stream<List<AttendeeModel>> get attendees$ => _attendeesSubject.stream;
  Sink<List<AttendeeModel>> get _attendees => _attendeesSubject.sink;

  getRandomPlace() async {
    Place randomPlace = await _placeService.getRandomPlace();
    _randomPlace.add(randomPlace);
  }

  getPlaces() async {
    List<Place> places = await _placeService.getAllPlaces();
    _places.add(places);
  }

  updateWeatherConditions() async {
    Map<String, double> l = await location.getLocation();
    Weather weather = await _weatherService.getByLatLon(Coord(
      lat: l["latitude"],
      lon: l["longitude"],
    ));
    _weatherCondition.add(weather);
  }

  updateAttendee(AttendeeModel attendee) async {
    List<AttendeeModel> selectedAttendees = await _attendeesSubject.first;
    int index = selectedAttendees.indexWhere((a) => a.name == attendee.name);
    selectedAttendees.replaceRange(index, index + 1, [attendee]);
    _attendees.add(List.from(selectedAttendees));
  }

  selectPlace(Place place) {
    _randomPlace.add(place);
  }

  updateNextMeeting(Duration nextMeetingIn) {
    _nextMeeting.add(nextMeetingIn);
  }

  makeDecision(bool going) async {
    Place place = await _randomPlaceSubject.first;
    Weather weather = await _weatherSubject.first;
    Duration nextMeeting = await _nextMeetingSubject.first;
    List<AttendeeModel> attendees = await _attendeesSubject.first;
    DateTime date = DateTime.now();
    Decision decision = Decision(
      place: place,
      weather: weather,
      time: date,
      dayOfWeek: date.weekday,
      nextMeetingIn: nextMeeting,
      attendees: attendees.where((a) => a.attending).map((a) => a.name).toList(),
      going: going,
    );
    try {
      await _decisionService.createDecision(decision);
    } catch (e) {
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
    _placesSubject.close();
  }
}
