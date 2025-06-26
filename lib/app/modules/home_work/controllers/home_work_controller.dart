import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeWorkController extends GetxController {
 var showAddHomeworkForm = false.obs;

 var selectedDate = DateTime.now().obs;
 var assignedController = TextEditingController();
 var notesController = TextEditingController();

 var selectedClass = 'Select Class'.obs;
 var selectedSubject = 'Select Subject'.obs;
 final List<String> stdClass = ['Select Class', 'Nursery', '1st', '2nd'];
 final List<String> subject = ['Select Subject', 'Maths', 'English', 'Hindi'];
 void setDate(DateTime date) => selectedDate.value = date;

 void toggleAddHomeworkForm() => showAddHomeworkForm.value = !showAddHomeworkForm.value;

 void refreshList() {
  // Refresh logic here
 }
}
