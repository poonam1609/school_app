import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/customeTextfield.dart';
import '../../../../HelperWidget/custome_dropDown.dart';
import '../controllers/edit_teacher_controller.dart';

class EditTeacherView extends GetView<EditTeacherController> {
   EditTeacherView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditTeacherController>();
    return Scaffold(
        body: SafeArea(child:
        Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Employee',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Update Employee',style: TextStyle(
                    fontSize:7.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Employee Form',
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '1. Basic Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      prefixIcon: Icons.person,
                      controller: controller.employeeName,
                      labelText: 'Employee Name', hintText: 'Employee Name', obscureText: false,
                    ),
                    SizedBox(height: 2.h),
                    Obx(() => Container(
                      width: double.infinity,
                      height: 20.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[50],
                      ),
                      child: controller.profileImage.value != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          controller.profileImage.value!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 40, color: Colors.grey[400]),
                          const SizedBox(height: 8),
                          const Text('No Image', style: TextStyle(color: Colors.grey)),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: controller.pickImage,
                            icon: const Icon(Icons.upload),
                            label: const Text('Upload Picture'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      prefixIcon: Icons.call,
                      controller: controller.mobileNumber,
                      labelText: 'Mobile Number', hintText: 'Mobile Number', obscureText: false,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      prefixIcon: Icons.calendar_today,
                      suffixIcon: Icons.calendar_month,
                      controller: controller.dateOfJoin,
                      onSuffixTap:  () => controller.selectDate(context, controller.dateOfJoin),
                      labelText: 'Date of Join',
                      hintText: 'Date of Join', obscureText: false,
                    ),
                    SizedBox(height: 2.h),
                    Obx(() => CustomDropdown(
                      value: controller.selectedRole.value,
                      items: controller.role,
                      onChanged: (value) => controller.selectedRole.value = value ?? 'Select Role',
                    )),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      hintText: 'Monthly Salary',
                      controller: controller.monthlySalary,
                      prefixIcon: Icons.attach_money,
                      keyboardType: TextInputType.number, labelText: 'Monthly Salary', obscureText: false,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '2. Other Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      hintText: 'Father Name',
                      controller: controller.fatherName,
                      prefixIcon: Icons.person_outline, labelText: 'Father Name', obscureText: false,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      hintText: 'Aadhar Number',
                      controller: controller.aadharNumber,
                      prefixIcon: Icons.credit_card,
                      keyboardType: TextInputType.number, labelText: 'Aadhar Number', obscureText: false,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      hintText: 'Education',
                      controller: controller.education,
                      prefixIcon: Icons.school, labelText: 'Education', obscureText: false,
                    ),
                    SizedBox(height: 2.h),
                    Obx(() => CustomDropdown(
                      value: controller.selectedGender.value,
                      items: controller.gender,
                      onChanged: (value) => controller.selectedGender.value = value ?? 'Select Gender',
                    )),
                    /*     Obx(() => CustomDropdown(
                        value: controller.selectedBloodGroup.value,
                        items: controller.bloodGroups,
                        onChanged: (value) => controller.selectedBloodGroup.value = value ?? 'Select Blood Group',
                      )),
                      Obx(() => CustomDropdown(
                        value: controller.selectedReligion.value,
                        items: controller.religions,
                        onChanged: (value) => controller.selectedReligion.value = value ?? 'Select Religion',
                      )),*/

                    CustomTextField(
                        hintText: 'Experience',
                        controller: controller.experience,
                        prefixIcon: Icons.work,
                        labelText: 'Experience',
                        obscureText: false
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                        hintText: 'Email Address',
                        controller: controller.emailAddress,
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email Address',
                        obscureText: false
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      hintText: 'Date of Birth',
                      controller: controller.dateOfBirth,
                      prefixIcon: Icons.cake,
                      suffixIcon: Icons.calendar_month,
                      labelText: 'Date of Birth', obscureText: false,
                      onSuffixTap: () => controller.selectDate(context, controller.dateOfBirth),
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      hintText: 'Home Address',
                      controller: controller.homeAddress,
                      prefixIcon: Icons.home, labelText: 'Home Address', obscureText: false,
                    ),
                    SizedBox(height: 4.h),
                    PrimaryButton(
                        text: 'Submit',
                        onPressed: controller.submitForm
                    ),
                  ],
                ),
              ),
            )
          ],
        ))

    );
  }
}
