import 'package:cricket/utils/enums.dart';

import '../controllers/upcoming_matches_controller.dart';
import '../utils/match_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingMatchesScreen extends StatelessWidget {
  const UpcomingMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UpcomingMatchesController controller = Get.put(UpcomingMatchesController());

    Future<void> _onRefresh() async {
      controller.dataLoaded.value = false;
      await controller.fetchUpcomingMatches();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upcoming Matches",
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
                return MatchDetailsWidget(listType: MatchType.upcoming, match: controller.data![index]);
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
