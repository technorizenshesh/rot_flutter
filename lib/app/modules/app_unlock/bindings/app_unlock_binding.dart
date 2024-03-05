import 'package:get/get.dart';

import '../controllers/app_unlock_controller.dart';

class AppUnlockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppUnlockController>(
      () => AppUnlockController(),
    );
  }
}
