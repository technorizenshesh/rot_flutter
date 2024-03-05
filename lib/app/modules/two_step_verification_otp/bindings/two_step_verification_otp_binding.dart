import 'package:get/get.dart';

import '../controllers/two_step_verification_otp_controller.dart';

class TwoStepVerificationOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoStepVerificationOtpController>(
      () => TwoStepVerificationOtpController(),
    );
  }
}
