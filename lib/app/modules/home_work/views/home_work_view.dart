/*
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/HelperWidget/customSearch.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:school_app/HelperWidget/customeTextfield.dart';
import 'package:school_app/HelperWidget/custome_dropDown.dart';
import 'package:school_app/app/modules/time_table/views/time_table_view.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/home_workCard.dart';
import '../controllers/home_work_controller.dart';

class HomeWorkView extends GetView<HomeWorkController> {
  HomeWorkController homeWorkController = Get.put(HomeWorkController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: homeWorkController,
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
              child: Obx((){
               return homeWorkController.showAddHomeworkForm.value ?_buildAddHomeworkForm():_buildHomeworkMainList(context);
              },)
            ),
          ),
        );
      },
    );
  }
}
Widget _buildHomeworkMainList(BuildContext context){
  return Column(
    children: [
      CustomText(text: "Add Homework",fontSize: 8.sp,fontWeight: FontWeight.bold,),
      SizedBox(height:2.h ,),
      CustomSearchInput(onChanged: (value) {}),
      SizedBox(height:5.h ,),
      PrimaryButton(
        icon: Icons.add_box_outlined,
        color: Theme.of(context).primaryColor,
        text: 'Add HomeWork',
        onPressed: () => homeWorkController.toggleAddHomeworkForm(),
      ),
      SizedBox(height:3.h ,),
      Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Assigned', fontSize: 5.5.sp),
            SizedBox(height: 1.h),
            InkWell(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: controller.selectedDate.value,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  controller.setDate(picked);
                  homeWorkController.assignedController.text =
                  "${picked.day}/${picked.month}/${picked.year}";
                }
              },
              child: AbsorbPointer( // <--- key fix
                child: CustomTextField(
                  prefixIcon: Icons.calendar_today,
                  controller: homeWorkController.assignedController,
                  obscureText: false,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            CustomText(text: 'Select Class', fontSize: 5.5.sp),
            SizedBox(height: 1.h),
            Obx(() => CustomDropdown(
              value:homeWorkController.selectedClass.value,
              items: homeWorkController.stdClass,
              onChanged: (value) =>
              homeWorkController.selectedClass.value = value ?? 'Select Class',
            )),
            SizedBox(height: 1.h),
            PrimaryButton(
              text: "Search Homework",
              onPressed: () {},
              color: Colors.black,
            ),

          ],
        ),
      ),
      SizedBox(height: 1.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Recent", style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold)),
          IconButton(
            icon: Icon(Icons.refresh, size: 9.sp),
            onPressed: controller.refreshList,
          ),
        ],
      ),
      SizedBox(height: 1.h,),
      ListView.builder(
        shrinkWrap: true,
        itemCount: 3, // dynamic later
        itemBuilder: (_, index) => HomeworkCard(
          className: index == 2 ? "Second" : "Nursery",
          date: "June 25, 2025",
          subject: index == 1 ? "Maths" : "Player",
          notes: "Homework Notes",
        ),
      ),
    ],
  );
}
Widget _buildAddHomeworkForm() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Add New Homework", fontSize: 8.sp, fontWeight: FontWeight.bold),
        SizedBox(height: 2.h),
        CustomTextField(

          controller: TextEditingController(),
          obscureText: false,
        ),
        SizedBox(height: 2.h),
        CustomTextField(

          controller: TextEditingController(),
          obscureText: false,
        ),
        SizedBox(height: 2.h),
        PrimaryButton(
          text: "Save Homework",
          onPressed: () {
            // Save logic here
          },
          color: Colors.green,
        ),
        SizedBox(height: 2.h),
        TextButton(
          onPressed: (){

          },
          child: Text("← Back to List", style: TextStyle(fontSize: 5.sp)),
        )
      ],
    ),
  );
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/HelperWidget/customSearch.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:school_app/HelperWidget/customeTextfield.dart';
import 'package:school_app/HelperWidget/custome_dropDown.dart';
import 'package:school_app/HelperWidget/home_workCard.dart';
import 'package:sizer_pro/sizer.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/home_work_controller.dart';

class HomeWorkView extends GetView<HomeWorkController> {
  final HomeWorkController homeWorkController = Get.put(HomeWorkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Obx(() {
          return homeWorkController.showAddHomeworkForm.value
              ? _buildAddHomeworkForm(context)
              : _buildHomeworkMainList(context);
        }),
      ),
    );
  }
  Widget _buildHomeworkMainList(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomText(text: "Add Homework", fontSize: 8.sp, fontWeight: FontWeight.bold),
          SizedBox(height: 2.h),
          CustomSearchInput(onChanged: (value) {}),
          SizedBox(height: 5.h),
          PrimaryButton(
            icon: Icons.add_box_outlined,
            color: Theme.of(context).primaryColor,
            text: 'Add Homework',
            onPressed: () => homeWorkController.toggleAddHomeworkForm(),
          ),
          SizedBox(height: 3.h),
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: customColors?.secondaryTextColor,
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Assigned', fontSize: 5.5.sp,color: customColors!.secondaryTextColor,),
                SizedBox(height: 1.h),
                InkWell(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: Get.context!,
                      initialDate: homeWorkController.selectedDate.value,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      homeWorkController.setDate(picked);
                      homeWorkController.assignedController.text =
                      "${picked.day}/${picked.month}/${picked.year}";
                    }
                  },
                  child: AbsorbPointer(
                    child: CustomTextField(
                      prefixIcon: Icons.calendar_today,
                      controller: homeWorkController.assignedController,
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                CustomText(text: 'Select Class', fontSize: 5.5.sp,color: customColors.secondaryTextColor,),
                SizedBox(height: 1.h),
                Obx(() => CustomDropdown(
                  value: homeWorkController.selectedClass.value,
                  items: homeWorkController.stdClass,
                  onChanged: (value) => homeWorkController.selectedClass.value =
                      value ?? 'Select Class',
                )),
                SizedBox(height: 1.h),
                PrimaryButton(
                  text: "Search Homework",
                  onPressed: () {},
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent", style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold)),
              IconButton(
                icon: Icon(Icons.refresh, size: 9.sp),
                onPressed: homeWorkController.refreshList,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_, index) => HomeworkCard(
              className: index == 2 ? "Second" : "Nursery",
              date: "June 25, 2025",
              subject: index == 1 ? "Maths" : "Player",
              notes: "Homework Notes",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddHomeworkForm(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: CustomText(text: "Add Homework", fontSize: 8.sp, fontWeight: FontWeight.bold,color: customColors!.primaryTextColor,)),
          SizedBox(height: 2.h),
          CustomText(text: 'Assigned', fontSize: 5.5.sp,color: customColors.primaryTextColor),
          SizedBox(height: 1.h),
          InkWell(
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: Get.context!,
                initialDate: homeWorkController.selectedDate.value,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                homeWorkController.setDate(picked);
                homeWorkController.assignedController.text =
                "${picked.day}/${picked.month}/${picked.year}";
              }
            },
            child: AbsorbPointer(
              child: CustomTextField(
                prefixIcon: Icons.calendar_today,
                controller: homeWorkController.assignedController,
                obscureText: false,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          CustomText(text: 'Select Class', fontSize: 5.5.sp,color: customColors.primaryTextColor),
          SizedBox(height: 1.h),
          Obx(() => CustomDropdown(
            value: homeWorkController.selectedClass.value,
            items: homeWorkController.stdClass,
            onChanged: (value) => homeWorkController.selectedClass.value =
                value ?? 'Select Class',
          )),
          CustomText(text: 'Select Subject', fontSize: 5.5.sp,color: customColors.primaryTextColor),
          SizedBox(height: 2.h),
          Obx(() => CustomDropdown(
            value: homeWorkController.selectedSubject.value,
            items: homeWorkController.subject,
            onChanged: (value) => homeWorkController.selectedSubject.value =
                value ?? 'Select Subject',
          )),
          CustomText(text: 'Homework Notes', fontSize: 5.5.sp,color: customColors.primaryTextColor),
          TextFormField(
            controller: homeWorkController.notesController,
            maxLines: 5,
            decoration: InputDecoration(
              filled: true,
              fillColor: customColors?.containerBackgroundColor,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color:  Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: Colors.grey, width: 1, ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.h),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),

              border: OutlineInputBorder(
                borderSide: BorderSide( color:  Colors.grey, width: 1,),
                borderRadius: BorderRadius.circular(1.h),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Text("Add Attachment", style: TextStyle(color:customColors?.primaryTextColor, fontSize: 5.6.sp)),
              SizedBox(width: 2.w),
              Icon(Icons.attachment_sharp, color: Colors.grey),
            ],
          ),
          SizedBox(height: 2.h),
          PrimaryButton(

            text: "Save Homework",
            onPressed: () {

            },
            color: Colors.blue,
          ),

        ],
      ),
    );
  }
}
