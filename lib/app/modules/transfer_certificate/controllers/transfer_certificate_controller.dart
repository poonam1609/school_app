import 'package:get/get.dart';

class TransferCertificateController extends GetxController {
  var selectedClass = 'Select Class'.obs;

  final List<String> std = ['Select Class', 'First', 'Nursery', 'Other'];

  final List<Map<String, dynamic>> students = [
    {
      'name': 'Arun Yadav',
      'gender':'male',
      'class': 'Nursery',
      'image': 'assets/image/boy_img.png',

    },
    {
      'name': 'Poonam Patel',
      'gender':'female',
      'class': 'First',
      'image': 'assets/image/girl_img.png',

    },
    {
      'name': 'Aditya Shinde',
      'gender':'male',
      'class': 'Second',
      'image': 'assets/image/boy_img.png',

    },
    {
      'name': 'Kirti Pal',
      'gender':'female',
      'class': 'Nursery',
      'image': 'assets/image/girl_img.png',

    },
    {
      'name': 'Nayna Patil',
      'gender':'male',
      'class': '10C',
      'image': 'assets/image/boy_img.png',

    },
  ];

}
