import 'package:get/get.dart';

import '../controllers/relieving_certificate_controller.dart';

class RelievingCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RelievingCertificateController>(
      () => RelievingCertificateController(),
    );
  }
}
