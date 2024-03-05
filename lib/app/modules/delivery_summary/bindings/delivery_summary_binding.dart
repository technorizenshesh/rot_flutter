import 'package:get/get.dart';

import '../controllers/delivery_summary_controller.dart';

class DeliverySummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliverySummaryController>(
      () => DeliverySummaryController(),
    );
  }
}
