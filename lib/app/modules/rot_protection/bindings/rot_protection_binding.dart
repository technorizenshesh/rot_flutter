import 'package:get/get.dart';

import '../controllers/rot_protection_controller.dart';

class RotProtectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RotProtectionController>(
      () => RotProtectionController(),
    );
  }
}
