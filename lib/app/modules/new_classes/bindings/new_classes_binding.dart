import 'package:get/get.dart';

import '../controllers/new_classes_controller.dart';

class NewClassesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewClassesController>(
      () => NewClassesController(),
    );
  }
}
