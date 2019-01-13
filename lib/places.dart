import 'dart:convert';

import 'package:what_4_lunch/place.dart';
import 'dart:math';

class Places {
  final String apiEndpoint = 'https://what4lunch-api.azurewebsites.net/api/random';
  final List<Place> _places = [
    Place(name: 'Pei Wei'),
    Place(name: "Shane's"),
    Place(name: 'Chipotle'),
    Place(name: 'The Habit'),
    Place(name: 'Señor Burrito'),
    Place(name: 'Jamaican'),
    Place(name: 'Cuban'),
    Place(name: "Santo's"),
    Place(name: '5 Spice'),
    Place(name: 'Punjab'),
    Place(name: 'Whole Foods'),
    Place(name: 'Ichiyami'),
    Place(name: 'Bombay Cafe'),
    Place(name: 'First Watch'),
    Place(name: 'Another Broken Egg'),
  ];
  
  final _random = new Random();

  getRandomPlace() {
    return _places[_random.nextInt(_places.length)];
  }

  Place mapPlace(String jsonStr) {
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return Place.fromJson(jsonMap);
  }
}

final places = Places();
