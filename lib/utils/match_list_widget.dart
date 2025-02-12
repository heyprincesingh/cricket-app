import '../models/matches_list_model.dart';
import 'package:cricket/utils/enums.dart';
import 'package:flutter/material.dart';
import '../utils/time_convertor.dart';
import 'package:get/get.dart';

class MatchDetailsWidget extends StatelessWidget {
  final MatchDetails match;
  final MatchType listType;

  const MatchDetailsWidget({super.key, required this.listType, required this.match});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: GestureDetector(
        onTap: () {
          if (listType == MatchType.live) {
            Get.toNamed(
              '/matchDetailsScreen',
              arguments: {"matchId": match.matchInfo!.matchId, "matchVenue": "${match.matchInfo!.venueInfo!.ground!}, ${match.matchInfo!.venueInfo!.city}"},
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Text(
                            match.matchInfo!.seriesName!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "${match.matchInfo!.venueInfo!.ground!}, ${match.matchInfo!.venueInfo!.city}",
                            style: const TextStyle(color: Colors.white54),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          convertTimestampToIST((match.matchInfo!.startDate!).substring(0, 10)),
                          style: const TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: match.matchInfo!.state == "Complete"
                            ? const Color(0xffdb2137)
                            : match.matchInfo!.state == "Upcoming"
                                ? const Color(0xfffaa432)
                                : const Color(0xff0dac13),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          match.matchInfo!.state!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff1c2026),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (MediaQuery.sizeOf(context).width - 90) / 2,
                            child: Text(
                              match.matchInfo!.team1!.teamName!,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.compare_arrows_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: (MediaQuery.sizeOf(context).width - 90) / 2,
                            child: Text(
                              match.matchInfo!.team2!.teamName!,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white38,
                      height: 30,
                      indent: 5,
                      endIndent: 5,
                      thickness: 2,
                    ),
                    Text(
                      match.matchInfo!.status!,
                      style: TextStyle(
                        color: match.matchInfo!.state == "Complete" ? const Color(0xffffbb0e) : Colors.white54,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
