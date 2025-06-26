import 'package:get/get.dart';

class RelievingCertificateController extends GetxController {
  var selectedTeacher = 'Select Teacher'.obs;

  final List<String> teacher = ['Select Teacher', 'First', 'Nursery', 'Other'];

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
