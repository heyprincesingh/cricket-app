import 'package:cricket/models/match_card_model.dart';
import '../config/api_endpoints.dart';

class MatchesCardService {
  static Future<MatchCardModel?> fetchMatchesList() async {
    try {
      final response = await MatchesListApi.fetchLiveMatches();

      if (response.statusCode == 200) {
        return MatchCardModel.fromJson(response.body);
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
