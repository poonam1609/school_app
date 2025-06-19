import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateNewpasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
}
