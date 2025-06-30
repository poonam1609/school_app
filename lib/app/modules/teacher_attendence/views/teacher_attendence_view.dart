import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/customSearch.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/custome_dropDown.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/teacher_attendence_controller.dart';

class TeacherAttendenceView extends GetView<TeacherAttendenceController> {
  TeacherAttendenceController teacherAttendenceController = Get.put(TeacherAttendenceController());
   TeacherAttendenceView({super.key});
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return GetBuilder(
      init: teacherAttendenceController,
      builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Center(
                child: CustomText(
                  text: 'Teacher Attendance',
                  color: Colors.black,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.w),
                  color: Colors.grey.shade400,
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: "Employee Name & Role",
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    Expanded(
                      child: CustomText(
                        text: "Status",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Expanded(
                child: ListView.separated(
                  itemCount: teacherAttendenceController.teachers.length,
                  separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
                  itemBuilder: (context, index) {
                    final teacher =
                    teacherAttendenceController.teachers[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.w),
                        border: Border.all(color:Colors.blue, width: 0.5),
                        color: customColors?.containerBackgroundColor,
                      ),
                      padding: EdgeInsets.all(3.w),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              teacher['name']??"",
                              style: TextStyle(
                                fontSize: 6.5.sp,
                                fontWeight: FontWeight.bold,
                                color: customColors?.secondaryTextColor,
                              ),
                            ),
                              SizedBox(height: 1.h),
                            Text(
                              teacher['role'],
                              style: TextStyle(
                                fontSize: 6.5.sp,

                                color: customColors?.secondaryTextColor,
                              ),
                            ),
                          ],),

                          Spacer(),
                          _statusIcon("P", Colors.green),
                          SizedBox(width: 2.w),
                          _statusIcon("A", Colors.red),
                          SizedBox(width: 2.w),
                          _statusIcon("L", Colors.blue.shade200),
                        ],
                      ),
                    );
                  },
                ),
              ),
              PrimaryButton(text: 'Submit', onPressed:(){} ,color: customColors?.buttonColor,)
            ],
          ),
        ),
      );
    },);
  }
}
Widget _statusIcon(String text, Color color) {
  return Container(
    width: 6.w,
    height: 6.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color.withOpacity(0.2),
      border: Border.all(color: color),
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 6.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
  );
}