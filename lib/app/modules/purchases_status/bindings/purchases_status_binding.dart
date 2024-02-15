import 'package:get/get.dart';

import '../controllers/purchases_status_controller.dart';

class PurchasesStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchasesStatusController>(
      () => PurchasesStatusController(),
    );
  }
}
