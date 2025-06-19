import 'package:get/get.dart';

import '../controllers/teacher_info_controller.dart';

class TeacherInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherInfoController>(
      () => TeacherInfoController(),
    );
  }
}
