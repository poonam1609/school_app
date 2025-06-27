import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customButton.dart';
import 'package:school_app/HelperWidget/customSearch.dart';
import 'package:school_app/HelperWidget/customText.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/custome_dropDown.dart';
import '../../../appTheme/customColor.dart';
import '../controllers/create_subject_controller.dart';

class CreateSubjectView extends GetView<CreateSubjectController> {
  CreateSubjectController createSubjectController = Get.put(
    CreateSubjectController(),
  );
  CreateSubjectView({super.key});
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return GetBuilder(
      init: createSubjectController,
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: 'Assign Subject',
                    color: Colors.black,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.5.h),
                CustomSearchInput(onChanged: (value) {}),
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
                    value: createSubjectController.selectedClass.value,
                    items: createSubjectController.std,
                    onChanged:
                        (value) =>
                            controller.selectedClass.value =
                                value ?? 'Select Class',
                  ),
                ),
                SizedBox(height: 1.h),
                // ROW: Subject & Marks
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subject",
                            style: TextStyle(
                              color: customColors?.primaryTextColor,
                              fontSize: 5.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          SizedBox(
                            height: 6.5.h, // fixed height
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: customColors?.primaryTextColor,
                                ),
                                filled: true,
                                fillColor: customColors?.textFieldFillColor,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 3.w,
                                  vertical: 0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1.h),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1.h),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1.h),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Marks",
                            style: TextStyle(
                              color: customColors?.primaryTextColor,
                              fontSize: 5.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          SizedBox(
                            height: 5.9.h, // match TextField height
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              decoration: BoxDecoration(
                                color: customColors?.textFieldFillColor,
                                borderRadius: BorderRadius.circular(1.h),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text(
                                    "Total Exam",
                                    style: TextStyle(
                                      color: customColors?.primaryTextColor,
                                    ),
                                  ),
                                  value: null,
                                  isExpanded: true,
                                  onChanged: (value) {},
                                  items:
                                      ['Mid Term', 'Final Exam']
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 45.w,
                      height: 6.5.h,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: customColors?.primaryTextColor,
                          size: 8.sp,
                        ),
                        label: Text(
                          "Remove field",
                          style: TextStyle(
                            color: customColors?.primaryTextColor,
                            fontSize: 6.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: customColors?.containerBackgroundColor,
                          side: BorderSide(color: Colors.grey.shade400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45.w,
                      height: 6.5.h,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 8.sp,
                        ),
                        label: Text(
                          "Add field",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide(color: Colors.grey.shade400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                PrimaryButton(
                  text: 'Assign Subject',
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
