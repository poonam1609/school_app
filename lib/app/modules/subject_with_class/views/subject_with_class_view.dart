import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../appTheme/customColor.dart';
import '../controllers/subject_with_class_controller.dart';

class SubjectWithClassView extends GetView<SubjectWithClassController> {
  SubjectWithClassController subjectWithClassController = Get.put(SubjectWithClassController());
   SubjectWithClassView({super.key});
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return GetBuilder(
     init: subjectWithClassController,
     builder: (controller) {
     return Scaffold(
       backgroundColor:customColors?.scaffoldBackgroundColor ,
       body: Padding(
         padding: EdgeInsets.all(3.w),
         child: ListView.builder(
           itemCount: subjectWithClassController.classData.length,
           itemBuilder: (_, index) {
             final item = subjectWithClassController.classData[index];
             return Container(
               margin: EdgeInsets.only(bottom: 2.h),
               padding: EdgeInsets.all(3.w),
               decoration: BoxDecoration(
                 color: customColors?.containerBackgroundColor,
                 borderRadius: BorderRadius.circular(3.w),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black12,
                     blurRadius: 4,
                     offset: Offset(0, 2),
                   ),
                 ],
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   // 🔹 Header Row
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(
                         item['class'], // e.g., "Nursery"
                         style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
                       ),
                       SizedBox(width: 3.w),
                       Row(
                         children: [
                           CircleAvatar(radius: 1.5.w, backgroundColor: Colors.blue),
                           SizedBox(width: 1.w),
                           Text("Obtained Marks", style: TextStyle(fontSize: 5.sp,fontWeight: FontWeight.bold,color: customColors?.secondaryTextColor )),
                           SizedBox(width: 4.w),
                           CircleAvatar(radius: 1.5.w, backgroundColor: Color(0xffB2D6FF)),
                           SizedBox(width: 1.w),
                           Text("Total Marks", style: TextStyle(fontSize: 5.sp,fontWeight: FontWeight.bold,color: customColors?.secondaryTextColor )),
                           SizedBox(width: 3.w),
                           Icon(Icons.edit_outlined, size: 8.sp, color: customColors?.primaryTextColor),
                         ],
                       ),
                     ],
                   ),
                   SizedBox(height: 1.5.h),
                   // 🔹 Bordered Section for Progress Bars
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.blue),
                       borderRadius: BorderRadius.circular(2.w),
                     ),
                     child: Column(
                       children: item['subjects'].map<Widget>((subj) {
                         final int marks = subj['marks'];
                         return Padding(
                           padding: EdgeInsets.symmetric(vertical: 0.7.h),
                           child: Row(
                             children: [
                               Expanded(flex: 3, child: Text(subj['name'], style: TextStyle(fontSize: 5.sp))),
                               Expanded(
                                 flex: 7,
                                 child: Stack(
                                   children: [
                                     Container(
                                       height: 1.5.h,
                                       decoration: BoxDecoration(
                                         color: Color(0xffB2D6FF),
                                         borderRadius: BorderRadius.circular(2.w),
                                       ),
                                     ),
                                     FractionallySizedBox(
                                       widthFactor: marks / 100,
                                       child: Container(
                                         height: 1.5.h,
                                         decoration: BoxDecoration(
                                           color: Colors.blue,
                                           borderRadius: BorderRadius.circular(2.w),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               SizedBox(width: 2.w),
                               Text("$marks/100", style: TextStyle(fontSize: 4.sp)),
                             ],
                           ),
                         );
                       }).toList(),
                     ),
                   ),
                   SizedBox(height: 1.5.h),
                   // 🔹 Total Line
                   Text(
                     "Total Subjects: 06 & Total Marks: 600",
                     style: TextStyle(fontSize: 4.sp, fontWeight: FontWeight.w600),
                   ),
                 ],
               ),
             );
           },
         ),
       ),
     );
   },);
  }
}
