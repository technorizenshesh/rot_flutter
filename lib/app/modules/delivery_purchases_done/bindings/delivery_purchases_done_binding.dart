import 'package:get/get.dart';

import '../controllers/delivery_purchases_done_controller.dart';

class DeliveryPurchasesDoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryPurchasesDoneController>(
      () => DeliveryPurchasesDoneController(),
    );
  }
}
