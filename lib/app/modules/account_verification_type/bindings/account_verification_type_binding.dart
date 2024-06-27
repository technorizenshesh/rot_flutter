import 'package:get/get.dart';

import '../controllers/account_verification_type_controller.dart';

class AccountVerificationTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountVerificationTypeController>(
      () => AccountVerificationTypeController(),
    );
  }
}
