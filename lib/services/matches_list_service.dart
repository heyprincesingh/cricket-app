import '../models/matches_list_model.dart';
import '../config/api_endpoints.dart';

class MatchesListService {
  static Future<MatchDetails?> fetchMatchesList() async {
    try {
      final response = await MatchesListApi.fetchLiveMatches();

      if (response.statusCode == 200) {
        return MatchDetails.fromJson(response.body);
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
