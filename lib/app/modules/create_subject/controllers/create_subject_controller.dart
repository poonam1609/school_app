import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateSubjectController extends GetxController {
  var nameController = TextEditingController();


  RxList<Map<String, dynamic>> subjectFields = [
    {'name': '', 'total': '', 'exam': ''}
  ].obs;
  var selectedClass = 'Select Class'.obs;

  final List<String> std = ['Select Class', 'First', 'Nursery', 'Other'];
}
