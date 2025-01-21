import 'package:cricket/controllers/tempData.dart';
import 'package:get/get.dart';
import '../models/matches_list_model.dart';
import '../services/matches_list_service.dart';
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
    Map<String, dynamic> extractedData = extractAndSortMatches(tempMatchesListData);

    data = (extractedData["matches"] as List)
        .map((json) => MatchDetails.fromJson(json))
        .toList();

    listLastUpdated = convertTimestampToIST(extractedData["responseLastUpdated"]);

    if (data != null) {
      dataLoaded.value = true;
    }
  }
}
