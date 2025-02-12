import '../services/matches_list_service.dart';
import '../models/matches_list_model.dart';
import 'package:cricket/utils/enums.dart';
import '../utils/time_convertor.dart';
import 'package:get/get.dart';

class LiveMatchesController extends GetxController {
  RxBool dataLoaded = false.obs;
  List<MatchDetails>? data;
  String? listLastUpdated;

  @override
  void onInit() {
    fetchLiveMatches();
    super.onInit();
  }

  fetchLiveMatches() async {
    Map<String, dynamic>? response = await MatchesListService.fetchMatchesList(MatchType.live);
    if (response != null) {
      data = response["matches"];
      listLastUpdated = convertTimestampToIST(response["responseLastUpdated"]);
    }

    if (data != null) {
      dataLoaded.value = true;
    }
  }
}
