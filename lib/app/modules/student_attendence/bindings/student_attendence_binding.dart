import 'package:get/get.dart';

import '../controllers/student_attendence_controller.dart';

class StudentAttendenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentAttendenceController>(
      () => StudentAttendenceController(),
    );
  }
}
