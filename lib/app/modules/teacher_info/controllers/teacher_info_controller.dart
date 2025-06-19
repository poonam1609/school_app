import 'dart:io';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

class TeacherInfoController extends GetxController {
  var employeeName = ''.obs;
  var mobileNumber = ''.obs;
  var emailAddress = ''.obs;
  var experience = ''.obs;
  var monthlySalary = ''.obs;
  var role = ''.obs;
  var gender = ' '.obs;
  var profileImage = Rx<File?>(null);
  var isViewMode = true.obs;
  var status='Active'.obs;
  var dateOfJoining = ''.obs;
  var address = ''.obs;
  var dateOfBirth = ''.obs;
  var bloodGroup = ''.obs;
  var religion = ''.obs;
  var fatherName = ''.obs;
  var education = ''.obs;
  var adhar = ''.obs;
  var username=''.obs;
  var password = ''.obs;
  @override
  void onInit() {
    super.onInit();
    final homeController = Get.find<HomeController>();
    final data = homeController.selectedModel.value;
    print("Loaded data for edit: ${Get.find<HomeController>().selectedModel.value}");

    if (data != null) {
      // dateOfJoining.value = data['Date of Joining'];
      // address.value= data['Address'];
      // dateOfBirth.value= data['Date of Birth'];
      // bloodGroup.value= data['Blood Group'];
      // religion.value= data['Religion'];
      // fatherName.value= data['Father Name'];
      // education.value= data['Education'];
      // adhar.value= data['Aadhar Number'];
      // username.value= data['Username'];
      // password.value= data['Password'];
      employeeName.value = data['name'] ?? '';
      mobileNumber.value = data['mobile'] ?? '';
      emailAddress.value = data['email'] ?? '';
      experience.value = data['experience'] ?? '';
      monthlySalary.value = data['monthlySalary'] ?? '';
      role.value = data['role'] ?? 'Select Role';
      gender.value = data['gender'] ?? 'Select Gender';
      isViewMode.value = true;
      //status.value=data['Active'];
      if (data['profileImage'] != null && data['profileImage'].toString().isNotEmpty) {
        profileImage.value = File(data['profileImage']);
      }

    }
  }
}
