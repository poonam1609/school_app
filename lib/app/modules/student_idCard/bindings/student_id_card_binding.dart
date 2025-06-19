import 'package:get/get.dart';

import '../controllers/student_id_card_controller.dart';

class StudentIdCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentIdCardController>(
      () => StudentIdCardController(),
    );
  }
}
