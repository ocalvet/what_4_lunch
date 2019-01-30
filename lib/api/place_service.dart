import 'dart:convert';

import 'package:what_4_lunch/constants.dart';
import 'package:what_4_lunch/models/place.dart';
import 'package:http/http.dart' as http;

class PlaceService {
  final String apiEndpoint = '$API_ENDPOINT/api';

  Future<Place> getRandomPlace() async {
    http.Response response = await http.get('$apiEndpoint/random');
    return mapPlace(response.body);
  }

  Future<List<Place>> getAllPlaces() async {
    http.Response response = await http.get('$apiEndpoint/places');
    List<Map<String, dynamic>> body = json.decode(response.body).cast<Map<String, dynamic>>();
    return body.map((Map<String, dynamic> jsonMap) {
      return Place.fromJson(jsonMap);
    }).cast<Place>().toList();
  }

  Place mapPlace(String jsonStr) {
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return Place.fromJson(jsonMap);
  }
}
