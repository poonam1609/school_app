import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customSearch.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/custome_dropDown.dart';
import '../controllers/relieving_certificate_controller.dart';

class RelievingCertificateView extends GetView<RelievingCertificateController> {
  RelievingCertificateController relievingCertificateController = Get.put(
    RelievingCertificateController(),
  );
  RelievingCertificateView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: relievingCertificateController,
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
                    text: 'Relieving Certificate',
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
                SizedBox(height: 5.h),
                CustomText(
                  text: 'Teacher',
                  color: Colors.grey.shade600,
                  fontSize: 5.5.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 0.5.h),
                Obx(
                  () => CustomDropdown(
                    value: relievingCertificateController.selectedTeacher.value,
                    items: relievingCertificateController.teacher,
                    onChanged:
                        (value) =>
                            controller.selectedTeacher.value =
                                value ?? 'Select Class',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset('assets/icons/icons_edit.svg'),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: relievingCertificateController.teachers.length,
                    separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
                    itemBuilder: (context, index) {
                      final teacher =
                          relievingCertificateController.teachers[index];
                      final genderColor =
                      teacher['gender'] == 'male'
                              ? Colors.blue
                              : Colors.pinkAccent;
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.w),
                          border: Border.all(color: genderColor, width: 0.5),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(2.w),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                teacher['image'],
                                width: 15.w,
                                height: 15.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // Align left inside the column
                                // center horizontally
                                children: [
                                  Text(
                                    teacher['name'],
                                    style: TextStyle(
                                      fontSize: 6.7.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h),
                                  Text(
                                    'Teacher: ${teacher['teacher']}',
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
