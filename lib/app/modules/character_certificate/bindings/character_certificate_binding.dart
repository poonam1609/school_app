import 'package:get/get.dart';

import '../controllers/character_certificate_controller.dart';

class CharacterCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterCertificateController>(
      () => CharacterCertificateController(),
    );
  }
}
