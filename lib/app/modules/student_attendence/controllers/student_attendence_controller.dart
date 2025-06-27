import 'package:get/get.dart';

class StudentAttendenceController extends GetxController {
  var selectedClass = 'Select Class'.obs;

  final List<String> std = ['Select Class', 'First', 'Nursery', 'Other'];

  final List<Map<String, dynamic>> students = [
    {'name': 'Arun Yadav', 'id': '2001'},
    {'name': 'Poonam Patel', 'id': '3032'},
    {'name': 'Aditya Shinde', 'id': '4001'},
    {'name': 'Kirti Pal', 'id': '1001'},
    {'name': 'Nayna Patil', 'id': '1021'},
  ];
}
