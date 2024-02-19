import 'package:get/get.dart';

import '../controllers/delivery_purchases_on_the_way_controller.dart';

class DeliveryPurchasesOnTheWayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryPurchasesOnTheWayController>(
      () => DeliveryPurchasesOnTheWayController(),
    );
  }
}
