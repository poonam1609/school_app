import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/app/modules/login/views/login_view.dart';

class OnboardingData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
class OnboardingController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;


  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      title: "Hello and Welcome!",
      description:
          "Get ready to explore powerful tools designed to simplify your life and boost productivity",
      imagePath: "assets/image/Onboarding_img1.svg",
    ),
    OnboardingData(
      title: "Stronger Connections",
      description:
          "Bring your world closer-share updates and\nstay in the loop.",
      imagePath: "assets/image/Onboarding_img2.svg",
    ),

    OnboardingData(
      title: "All Set to Go!",
      description:
          "Tap below and start enjoying the features just built for you.",
      imagePath: "assets/image/Onboarding_img3.svg",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding();
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() {
    Get.off(() => LoginView());
    print('Skip button tapped');
  }

  void completeOnboarding() {
    Get.offAllNamed('/main');
  }

  bool get isLastPage => currentPage.value == onboardingPages.length - 1;
  bool get isFirstPage => currentPage.value == 0;
}
