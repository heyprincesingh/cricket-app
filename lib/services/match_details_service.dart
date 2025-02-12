import 'dart:convert';

import 'package:cricket/utils/data_conversion.dart';

import '../models/match_details_model.dart';
import '../config/api_endpoints.dart';

class MatchDetailsService {
  static Future<MatchDetailsModel?> fetchMatchDetails(String matchId) async {
    try {
      final response = await MatchDetailsApi.fetchMatchDetails(matchId);

      if (response.statusCode == 200) {
        return MatchDetailsModel.fromJson(json.encode(convertKeysToList(json.decode(response.body))));
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
