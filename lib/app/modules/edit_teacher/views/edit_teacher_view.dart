import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_app/HelperWidget/customText.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: 'Update Employee Form',
                      fontWeight: FontWeight.bold,
                      fontSize: 6.5.sp,
                    ),
                    SizedBox(height: 3.h),

                    Obx(
                      () => Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          controller.profileImage.value != null
                              ? CircleAvatar(
                                radius: 40,
                                backgroundImage: FileImage(
                                  controller.profileImage.value!,
                                ),
                              )
                              : CircleAvatar(
                                radius: 40,
                                backgroundColor: const Color(
                                  0xFF1E88E5,
                                ).withOpacity(0.2),
                                child: const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: InkWell(
                              onTap: () => controller.pickImage(),
                              child: const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 3.h),
                    CustomText(
                      text: 'Update photo',
                      fontSize: 6.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 1.h),
                    CustomText(
                      textAlign: TextAlign.center,
                      color: Colors.grey.shade500,
                      text: 'Update photo so other members\nknow who you are.',
                      fontSize: 5.sp,
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'User Information',
                  fontWeight: FontWeight.bold,
                  fontSize: 6.sp,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 1.h),
              Divider(color: Theme.of(context).primaryColor),
              SizedBox(height: 1.h),
              CustomText(
                text: 'Full Name',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                color: const Color(0xffCBD2E0),
                prefixIcon: Icons.person,
                controller: controller.employeeName,

                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Contact Number',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                prefixIcon: Icons.call,
                controller: controller.mobileNumber,
                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Email',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.emailAddress,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Date Of Birth',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.dateOfBirth,
                prefixIcon: Icons.cake,
                suffixIcon: Icons.calendar_month,
                obscureText: false,
                onSuffixTap:
                    () =>
                        controller.selectDate(context, controller.dateOfBirth),
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Date of joining',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                prefixIcon: Icons.calendar_today,
                suffixIcon: Icons.calendar_month,
                controller: controller.dateOfJoin,
                onSuffixTap:
                    () => controller.selectDate(context, controller.dateOfJoin),

                obscureText: false,
              ),
              SizedBox(height: 2.h),
              CustomText(
                text: 'Position',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              Obx(
                () => CustomDropdown(
                  value: controller.selectedRole.value,
                  items: controller.role,
                  onChanged:
                      (value) =>
                          controller.selectedRole.value =
                              value ?? 'Select Role',
                ),
              ),

              CustomText(
                text: 'Salary',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.monthlySalary,
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Address',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.homeAddress,
                prefixIcon: Icons.home,
                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Additional Information',
                fontSize: 6.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 2.h),
              Divider(color: Theme.of(context).primaryColor),
              SizedBox(height: 2.h),
              CustomText(
                text: 'Father Name',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.fatherName,
                prefixIcon: Icons.person_outline,

                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Adhar Number',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.aadharNumber,
                prefixIcon: Icons.credit_card,
                keyboardType: TextInputType.number,

                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Education',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.education,
                prefixIcon: Icons.school,

                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Experience',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                controller: controller.experience,
                prefixIcon: Icons.work,
                obscureText: false,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Gender',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              Obx(
                () => CustomDropdown(
                  value: controller.selectedGender.value,
                  items: controller.gender,
                  onChanged:
                      (value) =>
                          controller.selectedGender.value =
                              value ?? 'Select Gender',
                ),
              ),

              CustomText(
                text: 'Blood Group',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              Obx(
                () => CustomDropdown(
                  value: controller.selectedBloodGroup.value,
                  items: controller.bloodGroups,
                  onChanged:
                      (value) =>
                          controller.selectedBloodGroup.value =
                              value ?? 'Select Blood Group',
                ),
              ),

              CustomText(
                text: 'Religion',
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 1.h),
              Obx(
                () => CustomDropdown(
                  value: controller.selectedReligion.value,
                  items: controller.religions,
                  onChanged:
                      (value) =>
                          controller.selectedReligion.value =
                              value ?? 'Select Religion',
                ),
              ),
              SizedBox(height: 4.h),
              PrimaryButton(
                color: Theme.of(context).primaryColor,
                text: 'Submit',
                onPressed: controller.submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
