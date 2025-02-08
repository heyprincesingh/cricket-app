import 'package:cricket/models/matches_list_model.dart';

Map<String, dynamic> extractAndSortMatches(Map<String, dynamic> data) {
  List<MatchDetails> inProgressMatches = [];
  List<MatchDetails> completeMatches = [];

  for (var matchType in data["typeMatches"]) {
    for (var series in matchType["seriesMatches"]) {
      if (series.containsKey("seriesAdWrapper") && series["seriesAdWrapper"].containsKey("matches")) {
        for (var match in series["seriesAdWrapper"]["matches"]) {
          if (match["matchInfo"]["state"] == "Complete") {
            completeMatches.add(MatchDetails.fromMap(match)); // Convert to MatchDetails
          } else {
            inProgressMatches.add(MatchDetails.fromMap(match)); // Convert to MatchDetails
          }
        }
      }
    }
  }

  // Sort both lists by "startDate" (assuming it's a string or can be compared)
  inProgressMatches.sort((b, a) {
    return a.matchInfo?.startDate?.compareTo(b.matchInfo?.startDate ?? "") ?? 0;
  });

  completeMatches.sort((b, a) {
    return a.matchInfo?.startDate?.compareTo(b.matchInfo?.startDate ?? "") ?? 0;
  });

  // Return the desired structure
  return {
    "responseLastUpdated": data["responseLastUpdated"],
    "matches": inProgressMatches + completeMatches, // Return List<MatchDetails>
  };
}
