import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customSearch.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/custome_dropDown.dart';
import '../controllers/character_certificate_controller.dart';

class CharacterCertificateView extends GetView<CharacterCertificateController> {
  CharacterCertificateController characterCertificateController = Get.put(
    CharacterCertificateController(),
  );

  CharacterCertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharacterCertificateController>(
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  Center(
                    child: CustomText(
                      text: 'Character Certificate',
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
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.person_add_alt, size: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  // Radio selection
                  Text(
                    "Select",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Obx(
                    () => Column(
                      children: [
                        _customRadioTile(
                          label: "Student",
                          value: "Student",
                          groupValue: controller.selectedType.value,
                          onChanged:
                              (val) => controller.selectedType.value = val!,
                        ),
                        SizedBox(height: 1.5.h),
                        _customRadioTile(
                          label: "Employee",
                          value: "Employee",
                          groupValue:
                              characterCertificateController.selectedType.value,
                          onChanged:
                              (val) =>
                                  characterCertificateController
                                      .selectedType
                                      .value = val!,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),

                  /// Student Section
                  Obx(
                    () => Visibility(
                      visible:
                          characterCertificateController.selectedType.value ==
                          'Student',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Class',
                            color: Colors.grey.shade600,
                            fontSize: 5.5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 0.5.h),
                          Obx(
                            () => CustomDropdown(
                              value:
                                  characterCertificateController
                                      .selectedClass
                                      .value,
                              items: characterCertificateController.std,
                              onChanged:
                                  (value) =>
                                      characterCertificateController
                                          .selectedClass
                                          .value = value ?? 'Select Class',
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                              'assets/icons/icons_edit.svg',
                            ),
                          ),
                          SizedBox(height: 2.h),

                          /// Student List
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                characterCertificateController.students.length,
                            separatorBuilder:
                                (_, __) => SizedBox(height: 1.5.h),
                            itemBuilder: (context, index) {
                              final student =
                                  characterCertificateController
                                      .students[index];
                              final genderColor =
                                  student['gender'] == 'male'
                                      ? Colors.blue
                                      : Colors.pinkAccent;
                              return _userTile(
                                image: student['image']!,
                                name: student['name']!,
                                subText: 'Class: ${student['class']}',
                                borderColor: genderColor,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Employee Section
                  Obx(
                    () => Visibility(
                      visible:
                          characterCertificateController.selectedType.value ==
                          'Employee',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Department',
                            color: Colors.grey.shade600,
                            fontSize: 5.5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 0.5.h),
                          Obx(
                            () => CustomDropdown(
                              value:
                                  characterCertificateController
                                      .selectedDepartment
                                      .value,
                              items: characterCertificateController.departments,
                              onChanged:
                                  (value) =>
                                      characterCertificateController
                                          .selectedDepartment
                                          .value = value ?? 'Select Department',
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                              'assets/icons/icons_edit.svg',
                            ),
                          ),
                          SizedBox(height: 2.h),
                          /// Employee List
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                characterCertificateController.teachers.length,
                            separatorBuilder:
                                (_, __) => SizedBox(height: 1.5.h),
                            itemBuilder: (context, index) {
                              final teacher =
                                  characterCertificateController
                                      .teachers[index];
                              final genderColor =
                                  teacher['gender'] == 'male'
                                      ? Colors.blue
                                      : Colors.pinkAccent;
                              return _userTile(
                                image: teacher['image']!,
                                name: teacher['name']!,
                                subText: 'Department: ${teacher['teacher']}',
                                borderColor: genderColor,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _userTile({
    required String image,
    required String name,
    required String subText,
    required Color borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(color: borderColor, width: 0.5),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(2.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              image,
              width: 15.w,
              height: 15.w,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 6.7.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  subText,
                  style: TextStyle(
                    fontSize: 5.8.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget _customRadioTile({
  required String label,
  required String value,
  required String groupValue,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(2.w),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 6.sp, color: Colors.grey.shade600),
          ),
        ),
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.black,
        ),
      ],
    ),
  );
}
