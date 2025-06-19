import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';
import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/onboarding_page.dart';
import '../../../../HelperWidget/page_indicator.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  final OnboardingController onboardingController = Get.put(OnboardingController());

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: onboardingController,
      builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: onboardingController.skipOnboarding,
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // Main PageView
              Expanded(
                child: PageView.builder(
                  controller: onboardingController.pageController,
                  onPageChanged: onboardingController.onPageChanged,
                  itemCount: onboardingController.onboardingPages.length,
                  itemBuilder: (context, index) {
                    return OnboardingPageItem(
                      data: onboardingController.onboardingPages[index],
                      // primaryColor: onboardingController.primaryColor,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingController.onboardingPages.length,
                      (index) => PageIndicator(
                    index: index,
                    currentPage: onboardingController.currentPage,
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Obx(() =>PrimaryButton(
                   color: Color(0xff363939),
                  text: onboardingController.currentPage.value ==
                      onboardingController.onboardingPages.length - 1
                      ? 'Login'
                      : 'Next',
                  onPressed: () {
                    if (onboardingController.currentPage.value ==
                        onboardingController.onboardingPages.length - 1) {
                      Get.offAllNamed('/login');
                    } else {
                      onboardingController.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                )
                ),
              ),
              SizedBox(height: 2.h,),
            ],
          ),
        ),
      );
    },);
  }

}
