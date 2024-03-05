import 'package:get/get.dart';

import '../controllers/recharge_summary_controller.dart';

class RechargeSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RechargeSummaryController>(
      () => RechargeSummaryController(),
    );
  }
}
