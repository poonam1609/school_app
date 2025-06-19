import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_id_card_controller.dart';

class StudentIdCardView extends GetView<StudentIdCardController> {
  const StudentIdCardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudentIdCardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StudentIdCardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
