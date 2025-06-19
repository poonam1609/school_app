import 'package:get/get.dart';

import '../controllers/forgot_verification_controller.dart';

class ForgotVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotVerificationController>(
      () => ForgotVerificationController(),
    );
  }
}
