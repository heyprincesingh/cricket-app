import '../controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Image.asset("assets/images/splashScreen-Image.jpg", fit: BoxFit.fill),
    );
  }
}
