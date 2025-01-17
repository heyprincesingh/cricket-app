import '../views/affiliate_screen.dart';
import '../views/recent_matches_screen.dart';
import '../views/live_matches_screen.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  List<dynamic> screensList = [const LiveMatchesScreen(), const RecentMatchesScreen(), const AffiliateScreen()];
  RxInt bottomNavSelected = 0.obs;
}