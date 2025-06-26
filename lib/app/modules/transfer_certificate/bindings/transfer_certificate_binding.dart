import 'package:get/get.dart';

import '../controllers/transfer_certificate_controller.dart';

class TransferCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransferCertificateController>(
      () => TransferCertificateController(),
    );
  }
}
