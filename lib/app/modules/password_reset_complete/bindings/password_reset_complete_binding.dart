import 'package:get/get.dart';

import '../controllers/password_reset_complete_controller.dart';

class PasswordResetCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordResetCompleteController>(
      () => PasswordResetCompleteController(),
    );
  }
}
