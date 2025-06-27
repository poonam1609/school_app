import 'package:get/get.dart';

import '../controllers/teacher_attendence_controller.dart';

class TeacherAttendenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherAttendenceController>(
      () => TeacherAttendenceController(),
    );
  }
}
