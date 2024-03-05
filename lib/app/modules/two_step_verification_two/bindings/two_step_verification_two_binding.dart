import 'package:get/get.dart';

import '../controllers/two_step_verification_two_controller.dart';

class TwoStepVerificationTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoStepVerificationTwoController>(
      () => TwoStepVerificationTwoController(),
    );
  }
}
