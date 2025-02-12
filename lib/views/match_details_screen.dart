import '../models/match_details_model.dart';
import '../controllers/match_details_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../utils/time_convertor.dart';
import 'package:get/get.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int matchId = Get.arguments["matchId"];
    final String matchVenue = Get.arguments["matchVenue"];
    final MatchDetailsController controller = Get.put(MatchDetailsController(matchId: matchId));

    return Scaffold(
      backgroundColor: const Color(0xff111417),
      appBar: AppBar(
        title: Obx(() {
          return Text(
            controller.isDataLoaded.value ? controller.data!.matchHeader!.seriesName! : "Match Details",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 1,
            ),
          );
        }),
        backgroundColor: const Color(0xff07151c),
        elevation: 10,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return controller.isDataLoaded.value
            ? RefreshIndicator(
                onRefresh: () async {
                  if (!controller.data!.isMatchComplete!) {
                    await controller.fetchMatchDetails();
                  }
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Container(
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
                                "${controller.data!.matchHeader!.matchFormat!} - ${controller.data!.matchHeader!.matchDescription!}",
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
                                bottomLeft: controller.data!.matchHeader!.state != "Complete" ? const Radius.circular(12) : Radius.zero,
                                bottomRight: controller.data!.matchHeader!.state != "Complete" ? const Radius.circular(12) : Radius.zero,
                                topLeft: Radius.zero,
                                topRight: Radius.zero,
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(
                                        convertTimestampToIST((controller.data!.matchHeader!.matchStartTimestamp!).toString().substring(0, 10)),
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
                                          matchVenue,
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
                                        child: _buildTeamOverallCard(
                                          context: context,
                                          teamName: controller.data!.scoreCard!.first.batTeamDetails!.batTeamName ?? "--",
                                          score: "${controller.data!.scoreCard!.first.scoreDetails!.runs.toString()}-${controller.data!.scoreCard!.first.scoreDetails!.wickets.toString()}" ?? "--",
                                          overs: 'Overs(${controller.data!.scoreCard!.first.scoreDetails!.overs.toString()})',
                                        ),
                                      ),
                                      Visibility(
                                        visible: controller.data!.scoreCard!.length == 2,
                                        child: Column(
                                          children: [
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
                                              child: _buildTeamOverallCard(
                                                context: context,
                                                teamName: controller.data!.scoreCard!.last.batTeamDetails!.batTeamName ?? "--",
                                                score: "${controller.data!.scoreCard!.last.scoreDetails!.runs.toString()}-${controller.data!.scoreCard!.last.scoreDetails!.wickets.toString()}" ?? "--",
                                                overs: 'Overs(${controller.data!.scoreCard!.last.scoreDetails!.overs.toString()})',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      controller.data!.isMatchComplete!
                                          ? const Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.check_circle_rounded,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  "   Finished",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Center(
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
                                            ),
                                      Visibility(
                                        visible: !controller.data!.isMatchComplete!,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: Text(
                                            controller.data!.status!,
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: !controller.data!.isMatchComplete!,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff1c2026),
                                        border: Border.all(color: const Color(0xff2f353f), width: 2),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: SizedBox(
                                        height: 110,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: controller.battingPlayers!.length + 1,
                                          itemBuilder: (context, index) {
                                            if (index == 0) {
                                              return Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff2f353f),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 5, right: 5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      _scoreCardTextBox(isName: true, index: 0, width: context.width * 0.35, text: "Batter"),
                                                      _scoreCardTextBox(index: 0, width: context.width * 0.1, text: "R"),
                                                      _scoreCardTextBox(index: 0, width: context.width * 0.1, text: "B"),
                                                      _scoreCardTextBox(index: 0, width: context.width * 0.1, text: "4s"),
                                                      _scoreCardTextBox(index: 0, width: context.width * 0.1, text: "6s"),
                                                      _scoreCardTextBox(index: 0, width: context.width * 0.115, text: "SR"),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }

                                            final player = controller.battingPlayers![index - 1];

                                            return Padding(
                                              padding: const EdgeInsets.only(left: 5, right: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  _scoreCardTextBox(isName: true, index: index, width: context.width * 0.35, text: player.batName!),
                                                  _scoreCardTextBox(index: index, width: context.width * 0.1, text: player.runs.toString()),
                                                  _scoreCardTextBox(index: index, width: context.width * 0.1, text: player.balls.toString()),
                                                  _scoreCardTextBox(index: index, width: context.width * 0.1, text: player.fours.toString()),
                                                  _scoreCardTextBox(index: index, width: context.width * 0.1, text: player.sixes.toString()),
                                                  _scoreCardTextBox(index: index, width: context.width * 0.115, text: player.strikeRate.toString()),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: controller.data!.isMatchComplete!,
                            child: Container(
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
                                  mainAxisAlignment: controller.data!.status!.contains("won") ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                  children: [
                                    if (controller.data!.status!.contains("won"))
                                      SvgPicture.asset(
                                        "assets/icons/trophy.svg",
                                        height: 50,
                                        width: 50,
                                      ),
                                    Text(
                                      controller.data!.status!,
                                      style: const TextStyle(
                                        color: Color(0xffffbb0e),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    if (controller.data!.status!.contains("won"))
                                      SvgPicture.asset(
                                        "assets/icons/trophy.svg",
                                        height: 50,
                                        width: 50,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: controller.data?.matchHeader?.playersOfTheMatch?.isNotEmpty ?? false,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 100,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: const BoxDecoration(
                                  color: Color(0xff2f353f),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "PLAYER OF THE MATCH",
                                        style: TextStyle(color: Color(0xffffbb0e), fontWeight: FontWeight.w600, fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context).width / 2.5,
                                            child: Text(
                                              controller.data?.matchHeader?.playersOfTheMatch?.isNotEmpty ?? false
                                                  ? controller.data!.matchHeader!.playersOfTheMatch!.last.name!
                                                  : "No Player", // Safe default value
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context).width / 2.5,
                                            child: Text(
                                              controller.data?.matchHeader?.playersOfTheMatch?.isNotEmpty ?? false
                                                  ? controller.data!.matchHeader!.playersOfTheMatch!.last.teamName!
                                                  : "No Team", // Safe default value
                                              textAlign: TextAlign.end,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data!.scoreCard!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.isTeamCardExpanded[index] = !controller.isTeamCardExpanded[index];
                                      },
                                      child: Obx(() {
                                        return Container(
                                          width: MediaQuery.sizeOf(context).width,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff2f353f),
                                            borderRadius: BorderRadius.all(Radius.circular(12)),
                                          ),
                                          child: _buildTeamDetailedCard(
                                            context: context,
                                            isExpanded: controller.isTeamCardExpanded[index],
                                            batTeamDetails: controller.data!.scoreCard![index].batTeamDetails!,
                                            bowlTeamDetails: controller.data!.scoreCard![index].bowlTeamDetails!,
                                          ),
                                        );
                                      }),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              }),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : controller.isLoadedFailed.value == true
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.fetchMatchDetails();
                          },
                          child: const Icon(
                            Icons.refresh_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Failed to load! Try again later",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
      }),
    );
  }

  Widget _buildTeamDetailedCard({
    required BuildContext context,
    required bool isExpanded,
    required BatTeamDetails batTeamDetails,
    required BowlTeamDetails bowlTeamDetails,
  }) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  batTeamDetails.batTeamName!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff1c2026),
                border: Border.all(
                  color: const Color(0xff2f353f),
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: SizedBox(
                height: (batTeamDetails.batsmenData!.length + bowlTeamDetails.bowlersData!.length + 2.2) * 35,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: batTeamDetails.batsmenData!.length + bowlTeamDetails.bowlersData!.length + 2,
                  itemBuilder: (context, index) {
                    return index == 0 || index == batTeamDetails.batsmenData!.length + 1
                        ? Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff2f353f),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _scoreCardTextBox(isName: true, index: 0, width: context.width * 0.4, text: index == 0 ? "Batter" : "Bowler"),
                                  _scoreCardTextBox(index: 0, width: context.width * 0.1, text: index == 0 ? "R" : "O"),
                                  _scoreCardTextBox(index: 0, width: context.width * 0.1, text: index == 0 ? "B" : "M"),
                                  _scoreCardTextBox(index: 0, width: context.width * 0.1, text: index == 0 ? "4s" : "R"),
                                  _scoreCardTextBox(index: 0, width: context.width * 0.1, text: index == 0 ? "6s" : "W"),
                                  _scoreCardTextBox(index: 0, width: context.width * 0.115, text: index == 0 ? "SR" : "ER"),
                                ],
                              ),
                            ),
                          )
                        : index <= batTeamDetails.batsmenData!.length
                            ? Padding(
                                padding: const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _scoreCardTextBox(isName: true, index: index, width: context.width * 0.4, text: batTeamDetails.batsmenData![index - 1].batName!),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: batTeamDetails.batsmenData![index - 1].runs.toString()),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: batTeamDetails.batsmenData![index - 1].balls.toString()),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: batTeamDetails.batsmenData![index - 1].fours.toString()),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: batTeamDetails.batsmenData![index - 1].sixes.toString()),
                                    _scoreCardTextBox(index: index, width: context.width * 0.115, text: batTeamDetails.batsmenData![index - 1].strikeRate.toString()),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _scoreCardTextBox(
                                        isName: true, index: index, width: context.width * 0.4, text: bowlTeamDetails.bowlersData![index - 2 - batTeamDetails.batsmenData!.length].bowlName!),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: bowlTeamDetails.bowlersData![index - 2 - batTeamDetails.batsmenData!.length].overs.toString()),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: bowlTeamDetails.bowlersData![index - 2 - batTeamDetails.batsmenData!.length].maidens.toString()),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: bowlTeamDetails.bowlersData![index - 2 - batTeamDetails.batsmenData!.length].runs.toString()),
                                    _scoreCardTextBox(index: index, width: context.width * 0.1, text: bowlTeamDetails.bowlersData![index - 2 - batTeamDetails.batsmenData!.length].wickets.toString()),
                                    _scoreCardTextBox(
                                        index: index, width: context.width * 0.115, text: bowlTeamDetails.bowlersData![index - 2 - batTeamDetails.batsmenData!.length].economy.toString()),
                                  ],
                                ),
                              );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _scoreCardTextBox({bool isName = false, required int index, required double width, required String text}) {
    return SizedBox(
      width: width,
      height: 35,
      child: Align(
        alignment: isName ? Alignment.centerLeft : Alignment.centerRight,
        child: Text(
          text,
          textAlign: isName ? TextAlign.start : TextAlign.center,
          style: TextStyle(
            color: index == 0 ? Colors.white : Colors.white70,
            fontSize: index == 0 ? 14 : 12,
          ),
        ),
      ),
    );
  }

  Widget _buildTeamOverallCard({required BuildContext context, required String teamName, required String score, required String overs}) {
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
