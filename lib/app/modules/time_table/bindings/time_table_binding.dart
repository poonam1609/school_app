import 'package:get/get.dart';

import '../controllers/time_table_controller.dart';

class TimeTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeTableController>(
      () => TimeTableController(),
    );
  }
}
