import 'package:get/get.dart';

import '../controllers/all_classes_controller.dart';

class AllClassesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllClassesController>(
      () => AllClassesController(),
    );
  }
}
