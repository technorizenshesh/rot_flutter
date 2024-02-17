import 'package:get/get.dart';

import '../controllers/recharge_done_controller.dart';

class RechargeDoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RechargeDoneController>(
      () => RechargeDoneController(),
    );
  }
}
