import 'package:get/get.dart';

import '../controllers/offer_letter_controller.dart';

class OfferLetterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferLetterController>(
      () => OfferLetterController(),
    );
  }
}
