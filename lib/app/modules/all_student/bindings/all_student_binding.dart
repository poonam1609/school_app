import 'package:get/get.dart';

import '../controllers/all_student_controller.dart';

class AllStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllStudentController>(
      () => AllStudentController(),
    );
  }
}
