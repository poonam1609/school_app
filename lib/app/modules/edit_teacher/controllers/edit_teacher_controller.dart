import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/controllers/home_controller.dart';

class EditTeacherController extends GetxController {
  final employeeName = TextEditingController();
  final mobileNumber = TextEditingController();
  final dateOfJoin = TextEditingController();
  final monthlySalary = TextEditingController();
  final fatherName = TextEditingController();
  final aadharNumber = TextEditingController();
  final education = TextEditingController();
  final experience = TextEditingController();
  final emailAddress = TextEditingController();
  final dateOfBirth = TextEditingController();
  final homeAddress = TextEditingController();

  var selectedRole = 'Select Role'.obs;
  var selectedGender = 'Select Gender'.obs;
  var selectedReligion = 'Select Religion'.obs;
  var selectedBloodGroup = 'Select Blood Group'.obs;
  var profileImage = Rx<File?>(null);
  var isEditMode = false.obs;
  var pageTitle = 'Add Employee'.obs;
  var submitButtonText = 'Add Employee'.obs;

  final List<String> role = ['Select Role', 'Principal', 'Teacher','UI Designer', 'Other'];
  final List<String> gender = ['Select Gender', 'Male', 'Female', 'Other'];
  final List<String> religions = ['Select Religion', 'Hindu', 'Muslim', 'Christian', 'Sikh', 'Other'];
  final List<String> bloodGroups = ['Select Blood Group', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage.value = File(image.path);
    }
  }

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  void submitForm() {
    // Validate and submit form
    Get.snackbar(
      'Success',
      'Employee form submitted successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    employeeName.dispose();
    mobileNumber.dispose();
    dateOfJoin.dispose();
    monthlySalary.dispose();
    fatherName.dispose();
    aadharNumber.dispose();
    education.dispose();
    experience.dispose();
    emailAddress.dispose();
    dateOfBirth.dispose();
    homeAddress.dispose();
    super.onClose();
  }
  @override
  void onInit() {
    super.onInit();
    final homeController = Get.find<HomeController>();
    final data = homeController.selectedModel.value;
    print("Loaded data for edit: ${Get.find<HomeController>().selectedModel.value}");


    if (data != null) {
      employeeName.text = data['name'] ?? '';
      mobileNumber.text = data['mobile'] ?? '';
      emailAddress.text = data['email'] ?? '';
      experience.text = data['experience'] ?? '';
      monthlySalary.text = data['monthlySalary'] ?? '';
      selectedRole.value = data['role'] ?? 'Select Role';
      selectedGender.value = data['gender'] ?? 'Select Gender';
      isEditMode.value = true;
      pageTitle.value = 'Edit Employee';
      submitButtonText.value = 'Update Employee';
    }
  }
}
