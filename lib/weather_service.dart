import 'dart:convert';

import 'package:what_4_lunch/constants.dart';
import 'package:what_4_lunch/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiEndpoint = '$API_ENDPOINT/api/weather';

  Future<Weather> getByZip(int zipCode) async {
    http.Response response = await http.get('$apiEndpoint/zip/$zipCode');
    return mapWeather(response.body);
  }

  Future<Weather> getByLatLon(Coord coord) async {
      http.Response response = await http.get('$apiEndpoint/lat/${coord.lat}/lon/${coord.lon}');
      return mapWeather(response.body);
    }
  
    Weather mapWeather(String jsonStr) {
      Map<String, dynamic> jsonMap = json.decode(jsonStr);
      return Weather.fromJson(jsonMap);
    }
}

final weatherService = WeatherService();
