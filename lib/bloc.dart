import 'package:what_4_lunch/bloc_base.dart';
import 'package:what_4_lunch/place.dart';
import 'package:rxdart/rxdart.dart';
import 'package:what_4_lunch/place_service.dart';
import 'package:what_4_lunch/weather.dart';
import 'package:what_4_lunch/weather_service.dart';

class ApplicationBloc extends BlocBase {
  final WeatherService weatherService;
  final PlaceService placeService;
  ApplicationBloc({this.weatherService, this.placeService});

  // Place
  BehaviorSubject<Place> _randomPlaceSubject = BehaviorSubject<Place>();
  Stream<Place> get place$ => _randomPlaceSubject.stream;
  Sink<Place> get _randomPlace => _randomPlaceSubject.sink;

  // Weather
  BehaviorSubject<Weather> weatherSubject = BehaviorSubject<Weather>();
  Stream<Weather> get weather$ => weatherSubject.stream;
  Sink<Weather> get _weatherCondition => weatherSubject.sink;
  
  getRandomPlace() async {
    Place randomPlace = await placeService.getRandomPlace();
    _randomPlace.add(randomPlace);
  }

  updateWeatherConditions(Coord coord) async {
    Weather weather = await weatherService.getByLatLon(coord);
    _weatherCondition.add(weather);
  }

  @override
  dispose() {
    _randomPlaceSubject.close();
    weatherSubject.close();
  }
}
