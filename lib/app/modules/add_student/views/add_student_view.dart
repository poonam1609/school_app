import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/customText.dart';
import '../../../../HelperWidget/custom_AddPerson.dart';
import '../../../../HelperWidget/customeTextfield.dart';
import '../../../../HelperWidget/custome_dropDown.dart';
import '../controllers/add_student_controller.dart';

class AddStudentView extends GetView<AddStudentController> {
  AddStudentController addStudentController = Get.put(AddStudentController());
   AddStudentView({super.key});
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
                text: 'Add Student',
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
                  labelText: 'Student Full Name',
                  hintText: 'Student Full Name',
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
                  labelText: 'Registration Number',
                  hintText: 'Registration Number',
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
                  labelText: 'Date of Admission',
                  hintText: 'Date of Admission',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  prefixIcon: Icons.discount_outlined,
                  controller: controller.discountFee,
                  labelText: 'Discount fee',
                  hintText: 'Discount fee',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  prefixIcon: Icons.call,
                  controller: controller.mobileNumber,
                  labelText: 'Mobile Number',
                  hintText: 'Mobile Number',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Home Address',
                  controller:  controller.homeAddress,
                  prefixIcon: Icons.home,
                  labelText: 'Home Address',
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
                  hintText: 'Date of Birth',
                  controller:  controller.dateOfBirth,
                  prefixIcon: Icons.cake,
                  suffixIcon: Icons.calendar_month,
                  labelText: 'Date of Birth',
                  obscureText: false,
                  onSuffixTap: () =>  controller.selectDate(context,  controller.dateOfBirth),
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Any Identification mark.?',
                  controller:  controller.idMark,
                  prefixIcon: Icons.contact_page,
                  suffixIcon: Icons.calendar_month,
                  labelText: 'Any Identification mark.?',
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
                  hintText: 'Disease if any.?',
                  controller:  controller.disease,
                  prefixIcon: 	Icons.coronavirus,
                  labelText: 'Disease if any.?',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Student Birth Form ID/NIC',
                  controller:  controller.studentBirthForm,
                  prefixIcon: Icons.contact_page_outlined,
                  labelText: "Student Birth Form ID/NIC",
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
                  hintText: 'Previous School',
                  controller:  controller.previousSchool,
                  prefixIcon: Icons.school,
                  labelText: 'Previous School',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Previous ID/Board Roll No.',
                  controller:  controller.previousID,
                  prefixIcon: 	Icons.badge,
                  labelText: 'Previous ID/Board Roll No.',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Any Additional Note.?',
                  controller:  controller.note,
                  prefixIcon: Icons.note_alt,
                  labelText: 'Any Additional Note.?',
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
                  hintText: 'Select Family',
                  controller:  controller.selectFamily,
                  prefixIcon: Icons.family_restroom,
                  keyboardType: TextInputType.number,
                  labelText: 'Select Family',
                  obscureText: false,
                ),

                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Enter Total Siblings',
                  controller:  controller.totalSibling,
                  prefixIcon: Icons.group,
                  keyboardType: TextInputType.number,
                  labelText: 'Enter Total Siblings',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Enter Current Address',
                  controller:  controller.currentAddress,
                  prefixIcon: 	Icons.home,
                  keyboardType: TextInputType.number,
                  labelText: 'Enter Current Address',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomText(text: "3. Father Information", fontWeight: FontWeight.bold,
                  fontSize: 8.sp,),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Father Name',
                  controller:  controller.fatherName,
                  prefixIcon: Icons.person_outline,
                  labelText: 'Father Name',
                  obscureText: false,
                ),

                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Education',
                  controller:  controller.fatherEducation,
                  prefixIcon:Icons.menu_book,
                  labelText: 'Education',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'National ID',
                  controller:  controller.fatherNationalID,
                  prefixIcon: 	Icons.credit_card,
                  labelText: 'National ID',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Mobile Number',
                  controller:  controller.fatherMobile,
                  prefixIcon:Icons.phone_android,
                  labelText: 'Mobile Number',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Occupation',
                  controller:  controller.fatherOccupation,
                  prefixIcon: Icons.work,
                  labelText: 'Occupation',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Profession',
                  controller:  controller.fatherProfession,
                  prefixIcon: Icons.business_center,
                  labelText: 'Profession',
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
                  hintText: 'Mother Name',
                  controller:  controller.motherName,
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.number,
                  labelText: 'Mother Name',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Education',
                  controller:  controller.motherEducation,
                  prefixIcon: Icons.school,
                  labelText: 'Education',
                  obscureText: false,
                ),

                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'National ID',
                  controller:  controller.motherNationalID,
                  prefixIcon: Icons.credit_card,
                  labelText: 'National ID',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Mobile Number',
                  controller:  controller.motherMobile,
                  prefixIcon: Icons.phone_android ,
                  labelText: 'Mobile Number',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Occupation',
                  controller:  controller.motherOccupation,
                  prefixIcon: 	Icons.work,
                  labelText: 'Occupation',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Profession',
                  controller:  controller.motherProfession,
                  prefixIcon: 	Icons.business_center,
                  labelText: 'Profession',
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
