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

  createDecision(Decision decision) async {
    Map<String, dynamic> bodyMap = decision.toJson();
    print(bodyMap);
    http.Response response = await http.post(
      apiEndpoint,
      headers: { 'Content-Type': 'application/json' },
      body: json.encode(bodyMap),
    );
    print(response.statusCode);
    if(response.statusCode != 200) throw Exception("Server error when creating a decision");
  }

  Decision mapDecision(String jsonStr) {
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return Decision.fromJson(jsonMap);
  }
}
