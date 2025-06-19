import 'package:get/get.dart';

import '../controllers/create_newpassword_controller.dart';

class CreateNewpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateNewpasswordController>(
      () => CreateNewpasswordController(),
    );
  }
}
