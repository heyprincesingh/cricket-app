import 'package:cricket/config/env.dart';

class ApiEndpoints {
  // Endpoints
  static const String baseUrl = "https://cricbuzz-cricket.p.rapidapi.com/matches/v1";

  // Params
  static const String liveMatches = "$baseUrl/live";
  static const String upcomingMatches = "$baseUrl/upcoming";
  static const String recentMatches = "$baseUrl/recent";

  // Headers
  static const Map<String, String> headers = {
    "x-rapidapi-host": "cricbuzz-cricket.p.rapidapi.com",
    "x-rapidapi-key": rapidapi_key,
  };
}
