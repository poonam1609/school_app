import 'package:get/get.dart';

import '../controllers/home_work_controller.dart';

class HomeWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeWorkController>(
      () => HomeWorkController(),
    );
  }
}
