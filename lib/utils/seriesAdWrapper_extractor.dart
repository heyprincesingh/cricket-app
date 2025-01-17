Map<String, dynamic> extractAndSortMatches(Map<String, dynamic> data) {
  List<Map<String, dynamic>> inProgressMatches = [];
  List<Map<String, dynamic>> completeMatches = [];

  for (var matchType in data["typeMatches"]) {
    for (var series in matchType["seriesMatches"]) {
      if (series.containsKey("seriesAdWrapper") && series["seriesAdWrapper"].containsKey("matches")) {
        for (var match in series["seriesAdWrapper"]["matches"]) {
          if (match["matchInfo"]["state"] == "Complete") {
            completeMatches.add(match);
          } else {
            inProgressMatches.add(match);
          }
        }
      }
    }
  }

  // Sort both lists by "startDate" (assuming it's a string or can be compared)
  inProgressMatches.sort((b, a) {
    return a["matchInfo"]["startDate"].compareTo(b["matchInfo"]["startDate"]);
  });

  completeMatches.sort((b, a) {
    return a["matchInfo"]["startDate"].compareTo(b["matchInfo"]["startDate"]);
  });

  return {"responseLastUpdated": data["responseLastUpdated"], "matches": inProgressMatches + completeMatches};
}
