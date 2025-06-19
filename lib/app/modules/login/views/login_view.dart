import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_app/app/routes/app_pages.dart';
import 'package:sizer_pro/sizer.dart';
import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/customeTextfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: loginController,
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFB2D6FF), Color(0xffF0F1F5)],
              begin: Alignment.bottomRight,
              end: Alignment.center,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(2.h),
                child: Form(
                  key: loginController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 4.h),
                      Hero(
                        tag: 'logo',
                        child: Container(
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                          ),
                          child: SvgPicture.asset(
                            "assets/image/splash_img.svg",
                            height: 18.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Sign in to your\nAccount',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 1.h),
                      CustomText(
                        text: 'Enter your email and password to log in ',
                        fontSize: 4.6.sp,fontWeight: FontWeight.bold,
                        color: Colors.grey[500]!,
                      ),
                      SizedBox(height: 3.h),
                      Material(
                        color: Colors.grey.shade50,
                        elevation: 7,
                        borderRadius: BorderRadius.circular(
                          2.h,
                        ), // Circular edges
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              2.h,
                            ), // Same as Material radius
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                text: "Email",
                                fontSize: 4.6.sp,fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,

                              ),
                              SizedBox(height: 1.h),
                              CustomTextField(
                                color: Color(0xffCBD2E0),
                                controller: loginController.emailController,
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                labelText: '',
                                hintText: 'Email',
                                obscureText: false,
                              ),
                              SizedBox(height: 4.h),
                              CustomText(
                                text: "Password",
                                color: Colors.grey.shade600,
                                fontSize: 4.6.sp,fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 1.h),
                              CustomTextField(
                                color: Color(0xffCBD2E0),
                                isPassword: true,
                                isPasswordVisible:
                                    loginController.isPasswordVisible,
                                togglePasswordVisibility:
                                    loginController.togglePasswordVisibility,
                                controller: loginController.passwordController,
                                hintText: 'Password',
                                prefixIcon: Icons.lock_open_outlined,
                                labelText: '',
                                obscureText: false,
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value:
                                          loginController
                                              .isRememberMeChecked
                                              .value,
                                      onChanged: (value) {
                                        loginController
                                            .isRememberMeChecked
                                            .value = value ?? false;
                                      },
                                      activeColor: const Color(0xff6C7278),
                                      side: BorderSide(color: Colors.grey),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      visualDensity: VisualDensity(
                                        horizontal: -4,
                                        vertical: -4,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize
                                              .shrinkWrap,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  CustomText(
                                    text: "Remember me",
                                    fontSize: 4.6.sp,fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(width: 25.w),
                                  InkWell(
                                    onTap: (){
                                      Get.toNamed(Routes.FORGET_PASSWORD);
                                    },
                                    child: CustomText(
                                      text: "Forgot Password.?",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 4.6.sp,
                                      color: Color(0xffA6A6A6),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              PrimaryButton(
                                color: Theme.of(context).primaryColor,
                                text: 'Login',
                                onPressed: () {
                                  Get.offAllNamed(Routes.HOME);
                                },
                              ),
                              SizedBox(height: 1.h),
                            ],
                          ),
                        ),
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
