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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h,),
                  Center(
                    child: CustomText(
                    text: 'Promote Student',
                    fontWeight: FontWeight.bold,
                    fontSize: 6.5.sp,
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
                      icon: Icon(Icons.refresh,color: Colors.black,),
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
                      label: Text("Refresh",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black) ,),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(child: CustomText(text: "S.NO.", color: Colors.black,fontWeight: FontWeight.bold,)),
                          Expanded(flex: 3, child: CustomText(text: "Student Name", color: Colors.black,fontWeight: FontWeight.bold)),
                          Expanded(child: CustomText(text: "Select", color: Colors.black,fontWeight: FontWeight.bold)),
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
                            margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                            padding: EdgeInsets.all(2.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.h),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                color: student.isFemale
                                    ? Color(0xffC838BA).withOpacity(0.7)
                                    : Color(0xff1E88E5).withOpacity(0.5),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text("${index + 1}", style: TextStyle(color: Colors.black)),
                                SizedBox(width:3.w),
                                CircleAvatar(
                                  radius: 25, // half of width/height
                                  backgroundImage: AssetImage(student.image),
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(width:3.w),
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
          ),
        );
      },
    );
  }
}
