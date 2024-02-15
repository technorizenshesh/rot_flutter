import 'package:get/get.dart';

import '../controllers/reset_password_mail_controller.dart';

class ResetPasswordMailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordMailController>(
      () => ResetPasswordMailController(),
    );
  }
}
