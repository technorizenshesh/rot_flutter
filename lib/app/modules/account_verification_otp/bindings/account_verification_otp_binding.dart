import 'package:get/get.dart';

import '../controllers/account_verification_otp_controller.dart';

class AccountVerificationOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountVerificationOtpController>(
      () => AccountVerificationOtpController(),
    );
  }
}
