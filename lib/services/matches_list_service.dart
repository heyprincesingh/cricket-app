import 'dart:convert';
import '../models/matches_list_model.dart';
import '../config/api_endpoints.dart';
import '../utils/seriesAdWrapper_extractor.dart';

enum MatchType { live, upcoming }

class MatchesListService {
  static Future<Map<String, dynamic>?> fetchMatchesList(MatchType type) async {
    try {
      final response = type == MatchType.live ? await MatchesListApi.fetchLiveMatches() : await MatchesListApi.fetchUpcomingMatches();
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Map<String, dynamic> extractedData = extractAndSortMatches(data);
        return extractedData;
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
