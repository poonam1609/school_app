import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customSearch.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/custome_dropDown.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/student_attendence_controller.dart';

class StudentAttendenceView extends GetView<StudentAttendenceController> {
  StudentAttendenceController studentAttendenceController = Get.put(
    StudentAttendenceController(),
  );
  StudentAttendenceView({super.key});
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return GetBuilder(
      init: studentAttendenceController,
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                Center(
                  child: CustomText(
                    text: 'Transfer Certificate',
                    color: Colors.black,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(child: CustomSearchInput(onChanged: (value) {})),
                    SizedBox(width: 1.w),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 12.w,
                        height: 5.9.h,
                        decoration: BoxDecoration(
                          color: customColors?.containerBackgroundColor,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.person_add_alt, size: 10.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                CustomText(
                  text: 'Class',
                  color: Colors.grey.shade600,
                  fontSize: 5.5.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 0.5.h),
                Obx(
                  () => CustomDropdown(
                    value: studentAttendenceController.selectedClass.value,
                    items: studentAttendenceController.std,
                    onChanged:
                        (value) =>
                            controller.selectedClass.value =
                                value ?? 'Select Class',
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                  color: customColors?.containerBackgroundColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "S.NO.",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CustomText(
                          text: "Student Name",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          text: "Select",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: studentAttendenceController.students.length,
                    separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
                    itemBuilder: (context, index) {
                      final student =
                          studentAttendenceController.students[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.w),
                          border: Border.all(color:Colors.blue, width: 0.5),
                          color: customColors?.containerBackgroundColor,
                        ),
                        padding: EdgeInsets.all(2.w),
                        child: Row(
                          children: [
                            Text(
                              student['id']??"",
                              style: TextStyle(
                                fontSize: 6.5.sp,

                                color: customColors?.primaryTextColor,
                              ),
                            ),
                          Spacer(),
                            Text(
                              student['name'],
                              style: TextStyle(
                                fontSize: 6.5.sp,
                                fontWeight: FontWeight.w600,
                                color: customColors?.primaryTextColor,
                              ),
                            ),
                            Spacer(),
                            _statusIcon("P", Colors.green),
                            SizedBox(width: 1.w),
                            _statusIcon("A", Colors.red),
                            SizedBox(width: 1.w),
                            _statusIcon("L", Colors.blue.shade200),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
