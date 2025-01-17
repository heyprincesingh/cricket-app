import 'package:cricket/controllers/tempLiveMatchesData.dart';
import 'package:get/get.dart';
import '../models/matches_list_model.dart';
import '../services/cricket_score_service.dart';
import '../utils/seriesAdWrapper_extractor.dart';
import '../utils/time_convertor.dart';

class LiveMatchesController extends GetxController {
  RxBool dataLoaded = false.obs;
  List<MatchDetails>? data;
  String? listLastUpdated;

  @override
  void onInit() {
    fetchLiveMatches();
    super.onInit();
  }

  fetchLiveMatches() {
    // data = await  MatchesListService.fetchMatchesList();
    Map<String, dynamic> extractedData = extractAndSortMatches(tempData);

    data = (extractedData["matches"] as List)
        .map((json) => MatchDetails.fromJson(json))
        .toList();

    listLastUpdated = convertTimestampToIST(extractedData["responseLastUpdated"]);

    if (data != null) {
      dataLoaded.value = true;
    }
  }
}
