import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewClassesController extends GetxController {
  final className = TextEditingController();
  final tutionFees = TextEditingController();

  var selectedTeacher = 'Select Teacher'.obs;

  final List<String> teacher = ['Select Teacher', 'Mical', 'John', 'Other'];


  @override
  void onClose() {
className.dispose();
tutionFees.dispose();

    super.onClose();
  }
}
