import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../appTheme/customColor.dart';
import '../controllers/password_reset_complete_controller.dart';

class PasswordResetCompleteView
    extends GetView<PasswordResetCompleteController> {
  PasswordResetCompleteController passwordResetCompleteController = Get.put(
    PasswordResetCompleteController(),
  );
  PasswordResetCompleteView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final customColors = Theme.of(context).extension<CustomColors>();
    return GetBuilder(
      init: passwordResetCompleteController,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(right: 5.w, top: 4.h),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            actions: [Icon(Icons.cancel_outlined)],
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDarkMode
                    ? [Colors.black.withOpacity(0.7), Colors.grey[900]!]
                    : [Color(0xFF1E88E5).withOpacity(0.5), Color(0xffF0F1F5)],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 17.h,
                    horizontal: 6.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icon_verificationcomlete.svg',
                      ),
                      SizedBox(height: 1.h),
                      CustomText(
                        text: "Successful",
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                        color: customColors!.primaryTextColor,
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        text:
                            "Congratulations! Your password has \nbeen changed. Click return to login",
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                      SizedBox(height: 7.h),
                      PrimaryButton(
                        text: 'Return to Login',
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
