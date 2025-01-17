import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_endpoints.dart';
import '../models/matches_list_model.dart';

class MatchesListService {
  static Future<MatchDetails?> fetchMatchesList() async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoints.upcomingMatches),
        headers: ApiEndpoints.headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return MatchDetails.fromJson(jsonData); // Convert JSON to model
      } else {
        print("Failed to fetch data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
