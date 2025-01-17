import 'package:cricket/controllers/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.put(NavController());
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await Get.dialog(
          AlertDialog(
            title: const Text("Exit"),
            content: const Text("Do you really want to exit the app?"),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: const Text("Yes"),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
        body: Obx(() {
          return controller.screensList[controller.bottomNavSelected.value];
        }),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            backgroundColor: const Color(0xff07151c),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.bottomNavSelected.value,
            onTap: (bottomNavSelected) {
              controller.bottomNavSelected.value = bottomNavSelected;
            },
            enableFeedback: true,
            selectedIconTheme: const IconThemeData(size: 32, color: Colors.white),
            unselectedIconTheme: const IconThemeData(size: 25, color: Color(0xff566880)),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home",
                tooltip: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_cricket_rounded,
                ),
                label: "Series",
                tooltip: "Series",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopify_rounded,
                ),
                label: "Affiliate",
                tooltip: "Affiliated Products",
              ),
            ],
          );
        }),
      ),
    );
  }
}
