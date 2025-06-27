import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:school_app/HelperWidget/customeTextfield.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../appTheme/customColor.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  final _formKey = GlobalKey<FormState>();
  ForgetPasswordController forgetPasswordController = Get.put<ForgetPasswordController>(ForgetPasswordController());
   ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final customColors = Theme.of(context).extension<CustomColors>();
    return GetBuilder(
      init: forgetPasswordController,
      builder: (controller) {
      return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_circle_left_outlined,color:customColors?.primaryTextColor
            ,)),
        ),
          body: Container(
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
                child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Forgot password",fontSize:7.sp ,fontWeight: FontWeight.bold,color: customColors!.primaryTextColor,),
                    SizedBox(height:3.h),
                    CustomText(text: "Enter your email ",fontWeight: FontWeight.bold,fontSize:6.sp,color: customColors.primaryTextColor),
                    SizedBox(height:0.5.h),
                    CustomText(text: "We will sent you a link to reset password",fontSize:4.8.sp,color: customColors.secondaryTextColor,fontWeight: FontWeight.bold),
                    SizedBox(height:3.h),
                    CustomText(text: "Email",color:customColors.secondaryTextColor,fontSize:6.sp,fontWeight: FontWeight.bold,),
                    SizedBox(height:1.h),
                    CustomTextField(
                      prefixIcon: Icons.email_outlined,
                        controller: forgetPasswordController.forgetController,obscureText: false),
                    SizedBox(height: 3.h,),
                    PrimaryButton(text: 'Reset Password', onPressed: (){
                      Get.toNamed(Routes.FORGOT_VERIFICATION);
                      },color: Theme.of(context).primaryColor,)
                  ],
                ),
              ),
            )),
          )
      );
    },);
  }
}
