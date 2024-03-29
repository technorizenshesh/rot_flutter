import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class TwoStepVerificationController extends GetxController {

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnCard() {
    Get.toNamed(Routes.TWO_STEP_VERIFICATION_TWO);
  }
}
