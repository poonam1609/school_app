import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/custome_dropDown.dart';
import '../controllers/promote_student_controller.dart';

class PromoteStudentView extends GetView<PromoteStudentController> {
  PromoteStudentController promoteStudentController = Get.put(PromoteStudentController());

  PromoteStudentView({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: promoteStudentController,
      builder: (controller) {
        controller.reset();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey.shade200,
                    padding: EdgeInsets.all(2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Student',
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Promote Student',
                          style: TextStyle(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Obx(
                        () => CustomDropdown(
                      value: controller.standard_class.value,
                      items: controller.std_class,
                      onChanged: (value) => controller.standard_class.value = value ?? 'Select Class',
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      controller.reset();             // Reset dropdowns and state
                      controller.fetchStudents();     // Fetch students (will be none initially)
                      controller.students.refresh();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                    ),
                    label: Text("Refresh"),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      children: [
                        Expanded(child: CustomText(text: "S.NO.", color: Colors.white)),
                        Expanded(flex: 3, child: CustomText(text: "Student Name", color: Colors.white)),
                        Expanded(child: CustomText(text: "Select", color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // ---------- ListView Builder for Students ----------
                  // ---------- Student List ----------
                  Obx(() {
                    if (controller.students.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Center(child: Text("No students found.")),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // So it doesn't conflict with parent scroll
                      itemCount: controller.students.length,
                      itemBuilder: (context, index) {
                        final student = controller.students[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 0.5.h),
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("${index + 1}", style: TextStyle(color: Colors.black)),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(student.name, style: TextStyle(color: Colors.black)),
                              ),
                              Expanded(
                                child: Obx(() => Checkbox(
                                  value: student.isSelected.value,
                                  onChanged: (bool? value) {
                                    controller.toggleSelection(index, value);
                                  },
                                )),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                  SizedBox(height: 2.h),

// ---------- Promote Section ----------
                  Obx(() => controller.showPromoteSection.value
                      ? Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        CustomText(text: 'Promote In', fontWeight: FontWeight.bold),
                        SizedBox(height: 2.h),
                        Obx(() => CustomDropdown(
                          value: controller.promoted_class.value,
                          items: controller.std_class
                              .where((e) => e == 'Select Class' || e != controller.standard_class.value)
                              .toList(),
                          onChanged: (value) =>
                          controller.promoted_class.value = value ?? 'Select Class',
                        )),
                        SizedBox(height: 2.h),
                        ElevatedButton(
                          onPressed: () => controller.promoteSelectedStudents(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                          ),
                          child: Text("SUBMIT", style: TextStyle(fontSize: 6.sp, color: Colors.white)),
                        ),
                      ],
                    ),
                  )
                      : SizedBox.shrink(),
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
