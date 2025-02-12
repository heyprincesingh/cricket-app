import 'dart:convert';
import 'package:cricket/utils/enums.dart';

import '../config/api_endpoints.dart';
import '../utils/data_conversion.dart';

class MatchesListService {
  static Future<Map<String, dynamic>?> fetchMatchesList(MatchType type) async {
    try {
      final response = type == MatchType.live ? await MatchesListApi.fetchLiveMatches() : await MatchesListApi.fetchUpcomingMatches();
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Map<String, dynamic> extractedData = extractAndSortMatches(type, data);
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
