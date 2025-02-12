import 'package:cricket/services/matches_list_service.dart';
import 'package:cricket/utils/time_convertor.dart';
import '../models/matches_list_model.dart';
import 'package:cricket/utils/enums.dart';

Map<String, dynamic> extractAndSortMatches(MatchType type, Map<String, dynamic> data) {
  List<MatchDetails> inProgressMatches = [];
  List<MatchDetails> completeMatches = [];

  for (var matchType in data["typeMatches"]) {
    for (var series in matchType["seriesMatches"]) {
      if (series.containsKey("seriesAdWrapper") && series["seriesAdWrapper"].containsKey("matches")) {
        for (var match in series["seriesAdWrapper"]["matches"]) {
          if (match["matchInfo"]["state"] == "Complete") {
            completeMatches.add(MatchDetails.fromMap(match));
          } else {
            inProgressMatches.add(MatchDetails.fromMap(match));
          }
        }
      }
    }
  }

  // Sort both lists by "startDate" (assuming it's a string or can be compared)
  if (type == MatchType.live) {
    inProgressMatches.sort((b, a) {
      return a.matchInfo?.startDate?.compareTo(b.matchInfo?.startDate ?? "") ?? 0;
    });

    completeMatches.sort((b, a) {
      return a.matchInfo?.startDate?.compareTo(b.matchInfo?.startDate ?? "") ?? 0;
    });
  } else {
    inProgressMatches.sort((a, b) {
      return a.matchInfo?.startDate?.compareTo(b.matchInfo?.startDate ?? "") ?? 0;
    });
  }

  inProgressMatches.forEach((element) {
    print("This is inProgressMatches: ${convertTimestampToIST(element.matchInfo!.startDate!.toString().substring(0, 10))}");
  });

  return {
    "responseLastUpdated": data["responseLastUpdated"],
    "matches": inProgressMatches + completeMatches,
  };
}

Map<String, dynamic> convertKeysToList(Map<String, dynamic> data) {
  const keysToConvert = ["batsmenData", "bowlersData", "wicketsData"];

  Map<String, dynamic> processMap(Map<String, dynamic> inputData) {
    inputData.forEach((key, value) {
      if (keysToConvert.contains(key) && value is Map<String, dynamic>) {
        inputData[key] = value.values.toList();
      } else if (value is Map<String, dynamic>) {
        inputData[key] = processMap(value);
      } else if (value is List) {
        for (var item in value) {
          if (item is Map<String, dynamic>) {
            item = processMap(item);
          }
        }
      }
    });
    return inputData;
  }

  return processMap(Map.from(data));
}
