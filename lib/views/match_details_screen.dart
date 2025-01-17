import 'package:cricket/controllers/match_details_controller.dart';
import 'package:cricket/utils/time_convertor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/matches_list_model.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchDetails matchDetails = Get.arguments;
    final MatchDetailsController controller = Get.put(MatchDetailsController(matchDetails: matchDetails));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.matchDetails.matchInfo!.seriesName!,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff07151c),
        elevation: 10,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: const Color(0xff111417),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: Color(0xff2f353f),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "${controller.matchDetails.matchInfo!.matchFormat!} - ${controller.matchDetails.matchInfo!.matchDesc!}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1c2026),
                  border: Border.all(color: const Color(0xff2f353f), width: 2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: controller.matchDetails.matchInfo!.state != "Complete" ? const Radius.circular(12) : Radius.zero,
                    bottomRight: controller.matchDetails.matchInfo!.state != "Complete" ? const Radius.circular(12) : Radius.zero,
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        convertTimestampToIST((controller.matchDetails.matchInfo!.startDate!).substring(0, 10)),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "${controller.matchDetails.matchInfo!.venueInfo!.ground!}, ${controller.matchDetails.matchInfo!.venueInfo!.city}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: _buildTeamScore(
                          context: context,
                          teamName: controller.matchDetails.matchInfo?.team1?.teamName ?? "--",
                          score: controller.matchDetails.matchScore?.team1Score != null
                              ? "${controller.matchDetails.matchScore!.team1Score!.inngs1?.runs ?? "0"}-${controller.matchDetails.matchScore!.team1Score!.inngs1?.wickets ?? "0"}"
                              : "--",
                          overs: controller.matchDetails.matchScore?.team1Score != null ? 'Overs(${controller.matchDetails.matchScore!.team1Score!.inngs1?.overs?.toString() ?? "--"})' : "Overs(--)",
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          "assets/icons/versus.svg",
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: _buildTeamScore(
                          context: context,
                          teamName: controller.matchDetails.matchInfo?.team2?.teamName ?? "--",
                          score: controller.matchDetails.matchScore?.team2Score != null
                              ? "${controller.matchDetails.matchScore!.team2Score!.inngs1?.runs ?? "0"}-${controller.matchDetails.matchScore!.team2Score!.inngs1?.wickets ?? "0"}"
                              : "--",
                          overs: controller.matchDetails.matchScore?.team2Score != null ? 'Overs(${controller.matchDetails.matchScore!.team2Score!.inngs1?.overs?.toString() ?? "--"})' : "Overs(--)",
                        ),
                      ),
                      controller.matchDetails.matchInfo!.state != "Complete"
                          ? Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "⦿  Live",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.red,
                                ),
                                Text(
                                  "   Finished",
                                  style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              controller.matchDetails.matchInfo!.state == "Complete"
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff2f353f),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: controller.matchDetails.matchInfo!.status!.contains("won") ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                          children: [
                            if (controller.matchDetails.matchInfo!.status!.contains("won"))
                              SvgPicture.asset(
                                "assets/icons/trophy.svg",
                                height: 50,
                                width: 50,
                              ),
                            Text(
                              controller.matchDetails.matchInfo!.status!,
                              style: const TextStyle(color: Color(0xffffbb0e), fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            if (controller.matchDetails.matchInfo!.status!.contains("won"))
                              SvgPicture.asset(
                                "assets/icons/trophy.svg",
                                height: 50,
                                width: 50,
                              ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamScore({
    required BuildContext context,
    required String teamName,
    required String score,
    required String overs,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 3,
          child: Text(
            teamName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          score,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 3,
          child: Text(
            overs,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
