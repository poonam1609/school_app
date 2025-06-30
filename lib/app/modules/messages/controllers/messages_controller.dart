import 'package:get/get.dart';

class MessagesController extends GetxController {
  var selectedType = 'Student'.obs;

  var selectedClass = 'Select Class'.obs;
  var std = ['Select Class', 'Nursery', '1st', '2nd', '3rd'];
  var selectedTeacher = 'Select Teacher'.obs;
  final List<String> teacher = ['Select Teacher', 'Principal', 'Teacher', 'Other'];

  var selectedDepartment = 'Select Department'.obs;
  var departments = ['Select Department', 'Admin', 'HR', 'Teaching'];

  var students = [
    {
      'name': 'Arun Yadav',
      'class': 'Nursery',
      'gender': 'male',
      'image': 'assets/image/boy_img.png',
    },
    {
      'name': 'Poonam Patel',
      'class': 'First',
      'gender': 'female',
      'image': 'assets/image/girl_img.png',
    },
    {
      'name': 'Aditya Shinde',
      'class': 'Second',
      'gender': 'male',
      'image': 'assets/image/boy_img.png',
    },
  ];
  final List<Map<String, dynamic>> teachers = [
    {
      'name': 'Arun Yadav',
      'gender':'male',
      'teacher': 'Principal',
      'image': 'assets/image/boy_img.png',

    },
    {
      'name': 'Poonam Patel',
      'gender':'female',
      'teacher': 'Teacher',
      'image': 'assets/image/girl_img.png',

    },
    {
      'name': 'Aditya Shinde',
      'gender':'male',
      'teacher': 'Principal',
      'image': 'assets/image/boy_img.png',

    },
    {
      'name': 'Kirti Pal',
      'gender':'female',
      'teacher': 'Teacher',
      'image': 'assets/image/girl_img.png',

    },
    {
      'name': 'Nayna Patil',
      'gender':'male',
      'teacher': 'Principal',
      'image': 'assets/image/boy_img.png',

    },
  ];

}
