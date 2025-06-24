import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/HelperWidget/customSearch.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:school_app/HelperWidget/customeTextfield.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/custome_dropDown.dart';
import '../controllers/new_classes_controller.dart';

class NewClassesView extends GetView<NewClassesController> {
  NewClassesController newClassesController = Get.put(NewClassesController());
   NewClassesView({super.key});
  @override
  Widget build(BuildContext context) {
  return GetBuilder(
    init: newClassesController,
    builder: (controller) {
    return Scaffold(
      body:  Padding(
        padding:  EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h,),
            Center(child: CustomText(text: 'Add New Class ',color: Colors.black,fontWeight: FontWeight.bold,
              fontSize:8.sp,)),
            SizedBox(height:4.h ,),
            CustomSearchInput(onChanged: (String value) {  },),
            SizedBox(height:4.h ,),
            CustomText(text: 'Class Name',color: Colors.grey.shade600,fontWeight: FontWeight.bold,),
            SizedBox(height:0.5.h ,),
            CustomTextField(
                controller: newClassesController.className, obscureText: false),
            SizedBox(height:3.h ,),
            CustomText(text: 'Termly Tuition Fees',color: Colors.grey.shade600,fontWeight: FontWeight.bold,),
            SizedBox(height:0.5.h ,),
            CustomTextField(
                controller: newClassesController.tutionFees, obscureText: false),
            SizedBox(height:3.h ,),
            CustomText(text: 'Select Teacher',color: Colors.grey.shade600,fontWeight: FontWeight.bold,),
            SizedBox(height:0.5.h ,),
            Obx(() => CustomDropdown(
              value: newClassesController.selectedTeacher.value,
              items: newClassesController.teacher,
              onChanged: (value) =>
              newClassesController.selectedTeacher.value = value ?? 'Select Teacher',
            )),
            SizedBox(height:3.h ,),
            PrimaryButton(text: 'Create Class', onPressed: (){},color: Theme.of(context).primaryColor,)
          ],
        ),
      ),
    );
  },);
  }
}
