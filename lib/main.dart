import 'package:cricket/views/live_matches_screen.dart';
import 'package:cricket/views/upcoming_matches_screen.dart';
import 'package:cricket/views/affiliate_screen.dart';
import 'package:cricket/views/splash_screen.dart';
import 'views/match_details_screen.dart';
import 'views/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Cricket',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      initialRoute: '/', // Define the initial route
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/nav', page: () => const NavScreen()),
        GetPage(name: '/home', page: () => const LiveMatchesScreen()),
        GetPage(name: '/matchDataScreen', page: () => const MatchDetailsScreen()),
        GetPage(name: '/upcoming', page: () => const UpcomingMatchesScreen()),
        GetPage(name: '/affiliate', page: () => const AffiliateScreen()),
      ],
    );
  }
}