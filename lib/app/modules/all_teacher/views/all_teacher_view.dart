import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';
import '../../../../HelperWidget/allteacher_cardWidget.dart';
import '../../../../HelperWidget/custom_AllPersonView.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/all_teacher_controller.dart';

class AllTeacherView extends GetView<AllTeacherController> {
  final AllTeacherController allTeacherController = Get.put(AllTeacherController());

  AllTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return AllItemView(
      title: 'All Employees',
      searchHint: 'Search employees...',
      onSearch: (value) {
        // Optionally handle search
        // allTeacherController.searchQuery.value = value;
      },
      onAddNew: () {
        final controller = Get.find<HomeController>();
        controller.selectMenu(101); // Navigate to Add Employee
      },
      items: allTeacherController.employees,
      itemBuilder: (employee, index) {
        return EmployeeCard(
          name: employee['name'] ?? '',
          role: employee['role'] ?? '',
          gender: employee['gender'] ?? '',
          mobile: employee['mobile'] ?? '',
          email: employee['email'] ?? '',
          experience: employee['experience'] ?? '',
          monthlySalary: employee['monthlySalary'] ?? '',
          onDelete: () => allTeacherController.deleteEmployee(index),
        );
      },
    );
  }
}
