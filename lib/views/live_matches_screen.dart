import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/live_matches_controller.dart';
import '../utils/time_convertor.dart';

class LiveMatchesScreen extends StatelessWidget {
  const LiveMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveMatchesController controller = Get.put(LiveMatchesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Live Cricket",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color(0xff07151c),
        elevation: 10,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: const Color(0xff111417),
        child: Obx(
          () => controller.dataLoaded.value
              ? ListView.builder(
                  itemCount: controller.data!.length + 1,
                  itemBuilder: (context, index) {
                    return index < controller.data!.length
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/matchDataScreen', arguments: controller.data![index]);
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
                                                  controller.data![index].matchInfo!.seriesName!,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                convertTimestampToIST((controller.data![index].matchInfo!.startDate!).substring(0, 10)),
                                                style: const TextStyle(color: Colors.white54),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: controller.data![index].matchInfo!.state == "Complete"
                                                  ? const Color(0xffdb2137)
                                                  : const Color(0xff0dac13),
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                              child: Text(
                                                controller.data![index].matchInfo!.state!,
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
                                                    controller.data![index].matchInfo!.team1!.teamName!,
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
                                                    controller.data![index].matchInfo!.team2!.teamName!,
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
                                            controller.data![index].matchInfo!.status!,
                                            style: TextStyle(
                                              color: controller.data![index].matchInfo!.state == "Complete" ? const Color(0xffffbb0e) : Colors.white54,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                "Last Updates: ${controller.listLastUpdated!}",
                                style: const TextStyle(
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          );
                  },
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
