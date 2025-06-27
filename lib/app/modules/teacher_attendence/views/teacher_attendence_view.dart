import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_attendence_controller.dart';

class TeacherAttendenceView extends GetView<TeacherAttendenceController> {
  const TeacherAttendenceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeacherAttendenceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TeacherAttendenceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
