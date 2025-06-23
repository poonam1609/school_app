import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../controllers/student_id_card_controller.dart';

class StudentIdCardView extends GetView<StudentIdCardController> {
  StudentIdCardController studentIdCardController = Get.put(StudentIdCardController());
  StudentIdCardView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: studentIdCardController,
      builder: (controller) {
      return Scaffold(
        body: ListView.builder(
          itemCount: studentIdCardController.student.length,
          itemBuilder: (context, index) {
            final student = studentIdCardController.student[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              margin: EdgeInsets.all(2.h),
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 15.sp,
                      backgroundImage: AssetImage("assets/image/student_img.jpg"),
                      backgroundColor: Colors.grey[200],
                    ),
                    SizedBox(height: 1.5.h),

                    // Name
                    Text(
                      "Poonam",
                      style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                    ),

                    // Registration ID
                    Text(
                      "ID:${"1234"}",
                      style: TextStyle(fontSize: 6.sp, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },);
  }
  }

