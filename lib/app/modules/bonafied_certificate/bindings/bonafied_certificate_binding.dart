import 'package:get/get.dart';

import '../controllers/bonafied_certificate_controller.dart';

class BonafiedCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BonafiedCertificateController>(
      () => BonafiedCertificateController(),
    );
  }
}
