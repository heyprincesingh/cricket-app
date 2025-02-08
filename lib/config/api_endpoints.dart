import 'package:cricket/config/env.dart';
import 'package:http/http.dart' as http;

class MatchesListApi {
  // Base URL
  static const String baseUrl = "https://cricbuzz-cricket.p.rapidapi.com/matches/v1";

  // Endpoints
  static const String liveMatches = "$baseUrl/live";
  static const String upcomingMatches = "$baseUrl/upcoming";
  static const String recentMatches = "$baseUrl/recent";

  // Headers
  static const Map<String, String> headers = {
    "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com",
    "x-rapidapi-key": rapidapi_key,
  };

  // Fetch live matches
  static Future<http.Response> fetchLiveMatches() async {
    try {
      final response = await http.get(Uri.parse(liveMatches), headers: headers);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  // Fetch upcoming matches
  static Future<http.Response> fetchUpcomingMatches() async {
    try {
      final response = await http.get(Uri.parse(upcomingMatches), headers: headers);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}

class MatchDetailsApi {
  // Base URL
  static const String baseUrl = "https://cricbuzz-cricket.p.rapidapi.com/mcenter/v1";

  // Headers
  static const Map<String, String> headers = {
    "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com",
    "x-rapidapi-key": rapidapi_key,
  };

  // Fetch match details
  static Future<http.Response> fetchMatchDetails(String matchId) async {
    final String url = "$baseUrl/$matchId/hscard";

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}