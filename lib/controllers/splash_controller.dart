import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), () {
      homeScreen();
    });
  }

  void homeScreen() {
    Get.offNamed('/nav');
  }
}
