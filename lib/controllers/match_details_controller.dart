import 'dart:convert';

import 'package:cricket/controllers/tempData.dart';
import 'package:cricket/utils/data_conversion.dart';

import '../services/match_details_service.dart';

import '../models/match_details_model.dart';
import 'package:get/get.dart';

class MatchDetailsController extends GetxController {
  MatchDetailsController({required this.matchId});

  late int matchId;

  RxBool isDataLoaded = false.obs;
  RxBool isLoadedFailed = false.obs;
  RxList<bool> isTeamCardExpanded = <bool>[].obs;
  MatchDetailsModel? data;
  List<BatsmenDatum>? battingPlayers;

  @override
  void onInit() {
    if (matchId > 0) {
      fetchMatchDetails();
    }
    super.onInit();
  }

  fetchMatchDetails() async {
    isDataLoaded.value = false;
    isLoadedFailed.value = false;
    data = await MatchDetailsService.fetchMatchDetails(matchId.toString());
    // data = MatchDetailsModel.fromJson(json.encode(convertKeysToList(tempMatchDetailData)));

    if (data != null) {
      isTeamCardExpanded.assignAll(List.filled(data!.scoreCard!.length, false));
      battingPlayers = data!.scoreCard!.last.batTeamDetails!.batsmenData!
          .where((player) => player.outDesc == "batting")
          .toList();
      isDataLoaded.value = true;
    }else{
      isLoadedFailed.value = true;
    }
  }
}
