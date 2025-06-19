import 'package:get/get.dart';

class AllStudentController extends GetxController {
  var student = <Map<String, String>>[].obs;

  @override
  void onInit() {
    student.addAll([
      {
        'name': 'Bruce Wayne',
        'registration_id': 'BW12345',
        'class_standard':'1st',
        'gender': 'Male',
        'mobile': '+91 9876543210',
        'email': 'john.doe@example.com',
        'experience': '3 years',
        'monthlySalary': '50000',
      },
      {
        'name': 'Jane Smith',
        'registration_id': '453',
        'class_standard':'5th',
        'gender': 'Female',
        'mobile': '+91 9123456780',
        'email': 'jane.smith@example.com',
        'experience': '4 years',
        'monthlySalary': '60000',
      },
      {
        'name': 'Daisy Brown',
        'registration_id': 'DB453',
        'class_standard':'5th',
        'gender': 'Female',
        'mobile': '+91 9123456780',
        'email': 'jane.smith@example.com',
        'experience': '4 years',
        'monthlySalary': '60000',
      },
      {
        'name': 'Bruce Wayne',
        'registration_id': 'WA453',
        'class_standard':'5th',
        'gender': 'male',
        'mobile': '+91 9123456780',
        'email': 'jane.smith@example.com',
        'experience': '4 years',
        'monthlySalary': '60000',
      },
    ]);

  }

  void deleteStudent(int index) {
    student.removeAt(index);
  }
}
