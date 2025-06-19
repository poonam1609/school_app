import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customText.dart';
import '../controllers/forgot_verification_controller.dart';

class ForgotVerificationView extends GetView<ForgotVerificationController> {
  ForgotVerificationController forgotVerificationController =Get.put(ForgotVerificationController());

  ForgotVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
   return GetBuilder(
     init: forgotVerificationController,
     builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_circle_left_outlined)),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E88E5).withOpacity(0.5), Color(0xffF0F1F5)],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Enter Code",fontSize:7.sp ,fontWeight: FontWeight.bold,color: Colors.grey.shade800,),
                  SizedBox(height: 3.h),
                  CustomText(text: "A reset code has been sent to ****91@gmail.com",fontSize:4.8.sp ,fontWeight: FontWeight.bold,color: Color(0xff989898),),
                  SizedBox(height: 0.5.h),
                  CustomText(text: " Enter the 6-digit code mentioned in the email.",fontSize:4.8.sp ,fontWeight: FontWeight.bold,color: Color(0xff989898),),
                  SizedBox(height: 4.h),
                  PinCodeTextField(
                    length: 6,
                    appContext: context,
                    onChanged: (value) => forgotVerificationController.enteredCode.value = value,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 5.9.h,
                      fieldWidth: 12.w,
                      activeColor: Theme.of(context).primaryColor,
                      selectedColor: Colors.grey,
                      inactiveColor: Colors.grey.shade400,
                    ),
                  ),
                  CustomText(text: "Didn’t received the code?",fontSize:5.2.sp ,color: Color(0xff989898),),
                  Text(
                    "Resend Code",
                    style: TextStyle(
                      fontSize: 5.2.sp,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,decorationColor:  Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 4.h,),
                  PrimaryButton(text: 'Verify Code', onPressed:(){Get.toNamed(Routes.CREATE_NEWPASSWORD);},color: Theme.of(context).primaryColor,)
                ],
              ),
            ),
          ),
        ),
      );
    },);
  }
}
