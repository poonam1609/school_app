import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../home/controllers/home_controller.dart';

class EditStudentController extends GetxController {
  final studentName = TextEditingController();
  final mobileNumber = TextEditingController();
  final fatherName = TextEditingController();
  final aadharNumber = TextEditingController();
  final education = TextEditingController();
  final dateOfBirth = TextEditingController();
  final homeAddress = TextEditingController();
  final registration = TextEditingController();
  final dateofadmission = TextEditingController();
  final discountFee = TextEditingController();
  final idMark = TextEditingController();
  final disease = TextEditingController();
  final studentBirthForm = TextEditingController();
  final previousID= TextEditingController();
  final previousSchool = TextEditingController();
  final note = TextEditingController();
  final selectFamily = TextEditingController();
  final totalSibling = TextEditingController();
  final currentAddress = TextEditingController();
  final fatherEducation = TextEditingController();
  final fatherNationalID = TextEditingController();
  final fatherMobile = TextEditingController();
  final fatherOccupation = TextEditingController();
  final fatherProfession = TextEditingController();
  final motherName = TextEditingController();
  final motherEducation = TextEditingController();
  final motherNationalID = TextEditingController();
  final motherMobile = TextEditingController();
  final motherOccupation = TextEditingController();
  final motherProfession = TextEditingController();

  var selectedDriver = 'Select Driver'.obs;
  var selectedIncome = 'Select Income'.obs;
  var selectedCaste = 'Select Caste'.obs;
  var selectedGender = 'Select Gender'.obs;
  var selectedReligion = 'Select Religion'.obs;
  var selectedBloodGroup = 'Select Blood Group'.obs;
  var standard_class ='Select class'.obs;
  var profileImage = Rxn<File?>(null);
  var isEditMode = false.obs;
  var pageTitle = 'Add Employee'.obs;
  var submitButtonText = 'Add Employee'.obs;
  var isOrphan = 'No'.obs;
  var isPhysicalDisability = 'No'.obs;

  final List<String> driver = ['Select Driver', 'John', 'David', 'Kim'];
  final List<String> income = ['Select Income', 'Less than 50,000', '50,000 to 1,00,000', 'Other'];
  final List<String> caste = ['Select Caste', 'ST', 'SC','OBC','General', 'Other'];
  final List<String> std_class = ['Select class', '1st', '2nd', 'Other'];
  final List<String> genders = ['Select Gender', 'Male', 'Female', 'Other'];
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

  void submitForm([String action = '']) {
    // Validate and submit form
    Get.snackbar(
      'Success',
      'Student form submitted successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
  @override
  void onInit() {
    super.onInit();
    final homeController = Get.find<HomeController>();
    final data = homeController.selectedModel.value;
    print("Loaded data for edit: ${Get.find<HomeController>().selectedModel.value}");


    if (data != null) {
       studentName.text= data['student_Name'] ?? '';
     mobileNumber.text= data['mobile_Number'] ?? '';
       fatherName.text= data['father_Name'] ?? '';
      aadharNumber.text = data['aadhar_Number'] ?? '';
       education.text = data['education'] ?? '';
       dateOfBirth.text= data['dateOf_Birth'] ?? '';
      homeAddress.text= data['home_Address'] ?? '';
      registration.text = data['registration'] ?? '';
      dateofadmission.text= data['dateof_admission'] ?? '';
       discountFee.text= data['discount_Fee'] ?? '';
      idMark.text= data['idMark'] ?? '';
      disease.text= data['disease'] ?? '';
    studentBirthForm.text= data['studentBirth_Form'] ?? '';
       previousID.text= data['previous_ID'] ?? '';
      note.text= data['note'] ?? '';
       selectFamily.text= data['select_Family'] ?? '';
      currentAddress.text= data['current_Address'] ?? '';
     fatherEducation .text= data['father_Education'] ?? '';
       fatherNationalID.text= data['fatherNational_ID'] ?? '';
     fatherMobile.text= data['father_Mobile'] ?? '';
       fatherOccupation.text = data['father_Occupation'] ?? '';
       fatherProfession.text = data['father_Profession'] ?? '';
      motherName.text = data['mother_Name'] ?? '';
       motherEducation.text= data['mother_Education'] ?? '';
       motherMobile.text = data['mother_Mobile'] ?? '';
     motherOccupation.text= data['mother_Occupation'] ?? '';
      motherProfession.text= data['mother_Profession'] ?? '';
       previousSchool.text= data['previous_School'] ?? '';
       totalSibling .text= data['total_Sibling'] ?? '';
       motherNationalID.text= data['motherNational_ID'] ?? '';

    }
  }
  @override
  void onClose() {
    studentName.dispose();
    mobileNumber.dispose();
    fatherName.dispose();
    aadharNumber.dispose();
    education.dispose();
    dateOfBirth.dispose();
    homeAddress.dispose();
    super.onClose();
  }}

