import 'package:get/get.dart';

import '../controllers/promote_student_controller.dart';

class PromoteStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromoteStudentController>(
      () => PromoteStudentController(),
    );
  }
}
