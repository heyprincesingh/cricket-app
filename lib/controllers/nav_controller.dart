import '../views/affiliate_screen.dart';
import '../views/upcoming_matches_screen.dart';
import '../views/live_matches_screen.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  List<dynamic> screensList = [const LiveMatchesScreen(), const UpcomingMatchesScreen(), const AffiliateScreen()];
  RxInt bottomNavSelected = 0.obs;
}