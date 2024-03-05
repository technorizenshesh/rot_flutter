import 'package:get/get.dart';

import '../controllers/login_with_email_controller.dart';

class LoginWithEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginWithEmailController>(
      () => LoginWithEmailController(),
    );
  }
}
