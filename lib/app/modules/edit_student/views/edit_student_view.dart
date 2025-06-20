import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/customeTextfield.dart';
import '../../../../HelperWidget/custome_dropDown.dart';
import '../controllers/edit_student_controller.dart';

class EditStudentView extends GetView<EditStudentController> {

  const EditStudentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 5.h,),
          Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CustomText(
                  text: 'Student',
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                ),

                CustomText(
                  text: 'Update Student',
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomText(
                      text: 'Student Form',
                      fontWeight: FontWeight.bold,
                      fontSize: 8.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    text: '1. Basic Information',
                    fontWeight: FontWeight.bold,
                    fontSize: 8.sp,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    prefixIcon: Icons.person,
                    controller: controller.studentName,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  Obx(
                        () => Container(
                      width: double.infinity,
                      height: 20.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[50],
                      ),
                      child:
                      controller.profileImage.value != null
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
                          Icon(
                            Icons.image,
                            size: 40,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'No Image',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () => controller.pickImage(),
                            icon: const Icon(Icons.upload),
                            label: const Text('Upload Picture'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    prefixIcon: 	Icons.app_registration,
                    controller: controller.registration,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  Obx(
                        () => CustomDropdown(
                      value:  controller.standard_class.value,
                      items:  controller.std_class,
                      onChanged:
                          (value) =>  controller.standard_class.value = value ?? 'Select Class',
                    ),
                  ),

                  CustomTextField(
                    prefixIcon: Icons.assignment_ind,
                    controller: controller.dateofadmission,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    prefixIcon: Icons.discount_outlined,
                    controller: controller.discountFee,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    prefixIcon: Icons.call,
                    controller: controller.mobileNumber,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.homeAddress,
                    prefixIcon: Icons.home,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '2. Other Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2.h),
                  Obx(
                        () => CustomDropdown(
                      value:  controller.selectedGender.value,
                      items:  controller.genders,
                      onChanged:
                          (value) =>
                      controller.selectedGender.value = value ?? 'Select Gender',
                    ),
                  ),
                  CustomTextField(

                    controller:  controller.dateOfBirth,
                    prefixIcon: Icons.cake,
                    suffixIcon: Icons.calendar_month,

                    obscureText: false,
                    onSuffixTap: () =>  controller.selectDate(context,  controller.dateOfBirth),
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.idMark,
                    prefixIcon: Icons.contact_page,
                    suffixIcon: Icons.calendar_month,

                    obscureText: false,
                    onSuffixTap: () =>  controller.selectDate(context,  controller.dateOfBirth),
                  ),
                  SizedBox(height: 2.h),

                  Obx(
                        () => CustomDropdown(
                      value:  controller.selectedBloodGroup.value,
                      items:  controller.bloodGroups,
                      onChanged:
                          (value) =>
                      controller.selectedBloodGroup.value =
                          value ?? 'Select Blood Group',
                    ),
                  ),
                  CustomTextField(

                    controller:  controller.disease,
                    prefixIcon: 	Icons.coronavirus,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.studentBirthForm,
                    prefixIcon: Icons.contact_page_outlined,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),

                  Obx(
                        () => CustomDropdown(
                      value:  controller.selectedCaste.value,
                      items:  controller.caste,
                      onChanged:
                          (value) =>
                      controller..selectedCaste.value = value ?? 'Select Caste',
                    ),
                  ),
                  CustomTextField(

                    controller:  controller.previousSchool,
                    prefixIcon: Icons.school,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.previousID,
                    prefixIcon: 	Icons.badge,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.note,
                    prefixIcon: Icons.note_alt,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:3.w,),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Orphan Student',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                        ),
                        Obx(() => Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: Text('Yes'),
                                value: 'Yes',
                                groupValue: controller.isOrphan.value,
                                onChanged: (value) => controller.isOrphan.value = value!,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: Text('No'),
                                value: 'No',
                                groupValue: controller.isOrphan.value,
                                onChanged: (value) => controller.isOrphan.value = value!,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:3.w,),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Physical Disability',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                        ),
                        Obx(() => Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: Text('Yes'),
                                value: 'Yes',
                                groupValue: controller.isPhysicalDisability.value,
                                onChanged: (value) => controller.isPhysicalDisability.value = value!,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: Text('No'),
                                value: 'No',
                                groupValue: controller.isPhysicalDisability.value,
                                onChanged: (value) => controller.isPhysicalDisability.value = value!,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),
                  Obx(
                        () => CustomDropdown(
                      value:  controller.selectedReligion.value,
                      items:  controller.religions,
                      onChanged:
                          (value) =>
                      controller.selectedReligion.value = value ?? 'Select Religion',
                    ),
                  ),
                  CustomTextField(

                    controller:  controller.selectFamily,
                    prefixIcon: Icons.family_restroom,
                    keyboardType: TextInputType.number,

                    obscureText: false,
                  ),

                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.totalSibling,
                    prefixIcon: Icons.group,
                    keyboardType: TextInputType.number,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.currentAddress,
                    prefixIcon: 	Icons.home,
                    keyboardType: TextInputType.number,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomText(text: "3. Father Information", fontWeight: FontWeight.bold,
                    fontSize: 8.sp,),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.fatherName,
                    prefixIcon: Icons.person_outline,

                    obscureText: false,
                  ),

                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.fatherEducation,
                    prefixIcon:Icons.menu_book,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.fatherNationalID,
                    prefixIcon: 	Icons.credit_card,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.fatherMobile,
                    prefixIcon:Icons.phone_android,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.fatherOccupation,
                    prefixIcon: Icons.work,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.fatherProfession,
                    prefixIcon: Icons.business_center,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  Obx(
                        () => CustomDropdown(
                      value:  controller.selectedIncome.value,
                      items:  controller.income,
                      onChanged:
                          (value) =>
                      controller.selectedIncome.value = value ?? 'Select Income',
                    ),
                  ),
                  CustomText(text: '4. Mother Information'),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.motherName,
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.number,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.motherEducation,
                    prefixIcon: Icons.school,

                    obscureText: false,
                  ),

                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.motherNationalID,
                    prefixIcon: Icons.credit_card,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.motherMobile,
                    prefixIcon: Icons.phone_android ,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.motherOccupation,
                    prefixIcon: 	Icons.work,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(

                    controller:  controller.motherProfession,
                    prefixIcon: 	Icons.business_center,

                    obscureText: false,
                  ),
                  SizedBox(height: 2.h),
                  Obx(
                        () => CustomDropdown(
                      value:  controller.selectedIncome.value,
                      items:  controller.income,
                      onChanged:
                          (value) =>
                      controller.selectedIncome.value = value ?? 'Select Income',
                    ),
                  ),

                  Obx(
                        () => CustomDropdown(
                      value:  controller.selectedDriver.value,
                      items:  controller.driver,
                      onChanged:
                          (value) =>
                      controller.selectedDriver.value = value ?? 'Select Driver',
                    ),
                  ),
                  SizedBox(height: 2.h),


                  PrimaryButton(
                    text: 'Submit',
                    onPressed: () =>controller.submitForm('submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),);
  }
}
