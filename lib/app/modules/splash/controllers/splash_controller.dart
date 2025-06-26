import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  Future<void> navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(Routes.ONBOARDING);
  }
  @override
  void onInit() {

    super.onInit();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );
    controller.forward();        // Start animation
    navigateToOnboarding();

  }
  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
