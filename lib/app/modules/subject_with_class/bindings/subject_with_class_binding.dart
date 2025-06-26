import 'package:get/get.dart';

import '../controllers/subject_with_class_controller.dart';

class SubjectWithClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectWithClassController>(
      () => SubjectWithClassController(),
    );
  }
}
