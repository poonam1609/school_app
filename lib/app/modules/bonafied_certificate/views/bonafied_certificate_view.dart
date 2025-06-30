import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customSearch.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/custome_dropDown.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/bonafied_certificate_controller.dart';

class BonafiedCertificateView extends GetView<BonafiedCertificateController> {
  BonafiedCertificateController bonafiedCertificateController = Get.put(BonafiedCertificateController());
   BonafiedCertificateView({super.key});
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return GetBuilder(
     init: bonafiedCertificateController,
     builder: (controller) {
     return Scaffold(
       body: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 4.w),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height:2.h),
             Center(
               child: CustomText(
                 text: 'Bonafied Certificate',
                 color: Colors.black,
                 fontSize: 9.sp,
                 fontWeight: FontWeight.bold,
               ),
             ),
             SizedBox(height: 3.h),
             CustomText(
               text: 'Class',
               color: Colors.grey.shade600,
               fontSize: 5.5.sp,
               fontWeight: FontWeight.bold,
             ),
             SizedBox(height: 0.5.h),
             Obx(
                   () => CustomDropdown(
                 value: bonafiedCertificateController.selectedClass.value,
                 items: bonafiedCertificateController.std,
                 onChanged:
                     (value) =>
                 controller.selectedClass.value =
                     value ?? 'Select Class',
               ),
             ),
           Align(
             alignment: Alignment.centerRight,
               child: SvgPicture.asset('assets/icons/icons_edit.svg')),
             SizedBox(height: 2.h),
             Expanded(
               child: ListView.separated(
                 itemCount: bonafiedCertificateController.students.length,
                 separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
                 itemBuilder: (context, index) {
                   final student = bonafiedCertificateController.students[index];
                   final genderColor = student['gender'] == 'male'
                       ? Colors.blue
                       : Colors.pinkAccent;
                   return Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(3.w),
                       border: Border.all(color: genderColor, width: 0.5),                       color:customColors?.containerBackgroundColor,
                     ),
                     padding: EdgeInsets.all(2.w),
                     child: Row(
                       children: [
                         ClipRRect(
                           borderRadius: BorderRadius.circular(100),
                           child: Image.asset(
                             student['image'],
                             width: 15.w,
                             height: 15.w,
                             fit: BoxFit.contain,
                           ),
                         ),
SizedBox(width: 16.w,),
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             // Align left inside the column
                             // center horizontally
                             children: [
                               Text(
                                 student['name'],
                                 style: TextStyle(
                                     fontSize: 6.7.sp,
                                     fontWeight: FontWeight.bold,
                                     color:customColors?.primaryTextColor),
                               ),
                               SizedBox(height: 0.5.h),
                               Text(
                                 'Class: ${student['class']}',
                                 style: TextStyle(fontSize: 5.8.sp, color: customColors?.primaryTextColor,),
                               ),
                             ],
                           ),
                         ),

                       ],
                     ),
                   );
                 },
               ),
             ),
           ],
         ),
       )
     );
   },);
  }
}
