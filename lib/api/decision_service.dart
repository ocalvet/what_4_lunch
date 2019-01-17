import 'dart:convert';

import 'package:what_4_lunch/constants.dart';
import 'package:what_4_lunch/models/decision.dart';
import 'package:http/http.dart' as http;

class DecisionService {
  final String apiEndpoint = '$API_ENDPOINT/api/decisions';

  Future<List<Decision>> getDecisions() async {
    http.Response response = await http.get(apiEndpoint);
    List<Map<String, dynamic>> decodedJson = json.decode(response.body);
    return decodedJson.map((json) => Decision.fromJson(json)).toList();
  }

  Decision mapDecision(String jsonStr) {
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return Decision.fromJson(jsonMap);
  }
}
