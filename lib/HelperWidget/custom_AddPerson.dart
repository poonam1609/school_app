/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer_pro/sizer.dart';
import '../../../../HelperWidget/customButton.dart';
import '../../../../HelperWidget/customeTextfield.dart';
import '../../../../HelperWidget/custome_dropDown.dart';

class AddPersonForm extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController nameController;
  final TextEditingController mobileController;
  final TextEditingController dateOfJoinController;
  final TextEditingController monthlySalaryController;
  final TextEditingController fatherNameController;
  final TextEditingController aadharController;
  final TextEditingController educationController;
  final TextEditingController experienceController;
  final TextEditingController emailController;
  final TextEditingController dobController;
  final TextEditingController addressController;

  final Rxn image;
  final Function pickImage;
  final RxString selectedRole;
  final List<String> roles;
  final RxString selectedGender;
  final List<String> genders;
  final RxString selectedBloodGroup;
  final List<String> bloodGroups;
  final RxString selectedReligion;
  final List<String> religions;
  final Function(String) onSubmit;
  final void Function(BuildContext, TextEditingController) onDatePick;

  const AddPersonForm({
    super.key,
    required this.title,
    required this.subtitle,
    required this.nameController,
    required this.mobileController,
    required this.dateOfJoinController,
    required this.monthlySalaryController,
    required this.fatherNameController,
    required this.aadharController,
    required this.educationController,
    required this.experienceController,
    required this.emailController,
    required this.dobController,
    required this.addressController,
    required this.image,
    required this.pickImage,
    required this.selectedRole,
    required this.roles,
    required this.selectedGender,
    required this.genders,
    required this.selectedBloodGroup,
    required this.bloodGroups,
    required this.selectedReligion,
    required this.religions,
    required this.onSubmit,
    required this.onDatePick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold)),
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
                  child: Text('$title Form', style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 2.h),
                Text('1. Basic Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 2.h),
                CustomTextField(prefixIcon: Icons.person, controller: nameController, labelText: 'Name', hintText: 'Name', obscureText: false),
                SizedBox(height: 2.h),
                Obx(() => Container(
                  width: double.infinity,
                  height: 20.h,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8), color: Colors.grey[50]),
                  child: image.value != null
                      ? ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.file(image.value!, fit: BoxFit.cover))
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 40, color: Colors.grey[400]),
                      const SizedBox(height: 8),
                      const Text('No Image', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () => pickImage(),
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload Picture'),
                        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 2.h),
                CustomTextField(prefixIcon: Icons.call, controller: mobileController, labelText: 'Mobile Number', hintText: 'Mobile Number', obscureText: false),
                SizedBox(height: 2.h),
                CustomTextField(
                  prefixIcon: Icons.calendar_today,
                  suffixIcon: Icons.calendar_month,
                  controller: dateOfJoinController,
                  onSuffixTap: () => onDatePick(context, dateOfJoinController),
                  labelText: 'Date of Join',
                  hintText: 'Date of Join',
                  obscureText: false,
                ),
                SizedBox(height: 2.h),
                Obx(() => CustomDropdown(value: selectedRole.value, items: roles, onChanged: (value) => selectedRole.value = value ?? 'Select Role')),
                SizedBox(height: 2.h),
                CustomTextField(hintText: 'Monthly Salary', controller: monthlySalaryController, prefixIcon: Icons.attach_money, keyboardType: TextInputType.number, labelText: 'Monthly Salary', obscureText: false),
                SizedBox(height: 2.h),
                Text('2. Other Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 2.h),
                CustomTextField(hintText: 'Father Name', controller: fatherNameController, prefixIcon: Icons.person_outline, labelText: 'Father Name', obscureText: false),
                SizedBox(height: 2.h),
                CustomTextField(hintText: 'Aadhar Number', controller: aadharController, prefixIcon: Icons.credit_card, keyboardType: TextInputType.number, labelText: 'Aadhar Number', obscureText: false),
                SizedBox(height: 2.h),
                CustomTextField(hintText: 'Education', controller: educationController, prefixIcon: Icons.school, labelText: 'Education', obscureText: false),
                SizedBox(height: 2.h),
                Obx(() => CustomDropdown(value: selectedGender.value, items: genders, onChanged: (value) => selectedGender.value = value ?? 'Select Gender')),
                Obx(() => CustomDropdown(value: selectedBloodGroup.value, items: bloodGroups, onChanged: (value) => selectedBloodGroup.value = value ?? 'Select Blood Group')),
                Obx(() => CustomDropdown(value: selectedReligion.value, items: religions, onChanged: (value) => selectedReligion.value = value ?? 'Select Religion')),
                CustomTextField(hintText: 'Experience', controller: experienceController, prefixIcon: Icons.work, labelText: 'Experience', obscureText: false),
                SizedBox(height: 2.h),
                CustomTextField(hintText: 'Email Address', controller: emailController, prefixIcon: Icons.email, keyboardType: TextInputType.emailAddress, labelText: 'Email Address', obscureText: false),
                SizedBox(height: 2.h),
                CustomTextField(
                  hintText: 'Date of Birth',
                  controller: dobController,
                  prefixIcon: Icons.cake,
                  suffixIcon: Icons.calendar_month,
                  labelText: 'Date of Birth',
                  obscureText: false,
                  onSuffixTap: () => onDatePick(context, dobController),
                ),
                SizedBox(height: 2.h),
                CustomTextField(hintText: 'Home Address', controller: addressController, prefixIcon: Icons.home, labelText: 'Home Address', obscureText: false),
                SizedBox(height: 4.h),
                PrimaryButton(text: 'Submit', onPressed: () => onSubmit('submit')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/
