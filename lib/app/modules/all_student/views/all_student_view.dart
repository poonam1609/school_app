import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/all_studentCard.dart';
import '../../../../HelperWidget/custom_AllPersonView.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/all_student_controller.dart';

class AllStudentView extends GetView<AllStudentController> {
  final AllStudentController allStudentController = Get.put(AllStudentController());
   AllStudentView({super.key});
  @override
  Widget build(BuildContext context) {
    return AllItemView(
      title: 'All Students',
      searchHint: 'Search Student...',
      onSearch: (value) {
        // Optionally handle search
        // allTeacherController.searchQuery.value = value;
      },
      onAddNew: () {
        final controller = Get.find<HomeController>();
        controller.selectMenu(202); // Navigate to Add Employee
      },

      items: allStudentController.student,
      itemBuilder: (student, index) {

        return StudentCard(
          name: student['name'] ?? '',
          class_standard:student['class_standard'],
          registrationId: student['registration_id'] ?? '',
          gender: student['gender'] ?? '',
          mobile: student['mobile'] ?? '',
          email: student['email'] ?? '',
          experience: student['experience'] ?? '',
          monthlySalary: student['monthlySalary'] ?? '',
          onDelete: () => allStudentController.deleteStudent(index),
        );
      },
      useGrid: false,
    );
  }
}
