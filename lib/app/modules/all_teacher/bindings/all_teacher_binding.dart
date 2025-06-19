import 'package:get/get.dart';

import '../controllers/all_teacher_controller.dart';

class AllTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTeacherController>(
      () => AllTeacherController(),
    );
  }
}
