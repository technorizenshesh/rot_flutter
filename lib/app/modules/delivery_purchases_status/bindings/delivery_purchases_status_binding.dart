import 'package:get/get.dart';

import '../controllers/delivery_purchases_status_controller.dart';

class DeliveryPurchasesStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryPurchasesStatusController>(
      () => DeliveryPurchasesStatusController(),
    );
  }
}
