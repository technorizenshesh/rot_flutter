import 'package:get/get.dart';

import '../controllers/sign_up_with_email_controller.dart';

class SignUpWithEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpWithEmailController>(
      () => SignUpWithEmailController(),
    );
  }
}
