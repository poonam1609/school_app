import 'package:get/get.dart';

class StudentIdCardController extends GetxController {
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

      },
      {
        'name': 'Jane Smith',
        'registration_id': '453',
        'class_standard':'5th',
        'gender': 'Female',
        'mobile': '+91 9123456780',
        'email': 'jane.smith@example.com',

      },
      {
        'name': 'Daisy Brown',
        'registration_id': 'DB453',
        'class_standard':'5th',
        'gender': 'Female',
        'mobile': '+91 9123456780',
        'email': 'jane.smith@example.com',

      },
      {
        'name': 'Bruce Wayne',
        'registration_id': 'WA453',
        'class_standard':'5th',
        'gender': 'male',
        'mobile': '+91 9123456780',
        'email': 'jane.smith@example.com',

      },
    ]);

  }
}
class Student {
  final String name;
  final String registrationId;
  final String classStandard;
  final String gender;
  final String mobile;
  final String email;
  final String image; // asset path or URL

  Student({
    required this.name,
    required this.registrationId,
    required this.classStandard,
    required this.gender,
    required this.mobile,
    required this.email,
    required this.image,
  });
}