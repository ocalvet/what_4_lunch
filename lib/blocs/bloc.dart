import 'package:what_4_lunch/blocs/bloc_base.dart';
import 'package:what_4_lunch/models/place.dart';
import 'package:rxdart/rxdart.dart';
import 'package:what_4_lunch/api/place_service.dart';
import 'package:what_4_lunch/models/weather.dart';
import 'package:what_4_lunch/api/weather_service.dart';

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
