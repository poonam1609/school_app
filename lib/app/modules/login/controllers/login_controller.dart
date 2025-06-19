import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  class LoginController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isRememberMeChecked = false.obs;
  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    print("Password visibility: ${isPasswordVisible.value}");
  }

  void login() {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  if (email.isEmpty || !GetUtils.isEmail(email)) {
  Get.snackbar('Error', 'Please enter a valid email',
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.redAccent,
  colorText: Colors.black);
  return;
  }

  if (password.isEmpty || password.length < 6) {
  Get.snackbar('Error', 'Password must be at least 6 characters',
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.redAccent,
  colorText: Colors.black);
  return;
  }

  Get.snackbar('Success', 'Logged in successfully!',
  snackPosition: SnackPosition.BOTTOM,
  backgroundColor: Colors.green,
  colorText: Colors.white);
  }

  @override
  void onClose() {
  emailController.dispose();
  passwordController.dispose();
  super.onClose();
  }
  }


