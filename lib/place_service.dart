import 'dart:convert';

import 'package:what_4_lunch/constants.dart';
import 'package:what_4_lunch/place.dart';
import 'package:http/http.dart' as http;

class PlaceService {
  final String apiEndpoint = '$API_ENDPOINT/api/random';

  getRandomPlace() async {
    http.Response response = await http.get(apiEndpoint);
    return mapPlace(response.body);
  }

  Place mapPlace(String jsonStr) {
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return Place.fromJson(jsonMap);
  }
}

final places = PlaceService();
