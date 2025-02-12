import 'package:cricket/utils/enums.dart';

import '../controllers/live_matches_controller.dart';
import '../utils/match_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveMatchesScreen extends StatelessWidget {
  const LiveMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveMatchesController controller = Get.put(LiveMatchesController());

    Future<void> _onRefresh() async {
      controller.dataLoaded.value = false;
      await controller.fetchLiveMatches();
    }

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
              () => RefreshIndicator(
            onRefresh: _onRefresh,
            child: controller.dataLoaded.value
                ? ListView.builder(
              itemCount: controller.data!.length,
              itemBuilder: (context, index) {
                return MatchDetailsWidget(listType: MatchType.live, match: controller.data![index]);
              },
            )
                : const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
