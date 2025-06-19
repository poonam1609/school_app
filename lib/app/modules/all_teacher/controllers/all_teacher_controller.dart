import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AllTeacherController extends GetxController {
  var employees = <Map<String, String>>[].obs;

  @override
  void onInit() {
    employees.addAll([
      {
        'name': 'John Doe',
        'role': 'Principal',
        'gender': 'Male',
        'mobile': '+91 9876543210',
        'email': 'john.doe@example.com',
        'experience': '3 years',
        'monthlySalary': '50000',
      },
      {
        'name': 'Jane Smith',
        'role': 'UI Designer',
        'gender': 'Female',
        'mobile': '+91 9123456780',
        'email': 'jane.smith@example.com',
        'experience': '4 years',
        'monthlySalary': '60000',
      },
    ]);

  }

  void deleteEmployee(int index) {
    employees.removeAt(index);
  }
}
