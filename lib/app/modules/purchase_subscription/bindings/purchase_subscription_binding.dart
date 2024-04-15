import 'package:get/get.dart';

import '../controllers/purchase_subscription_controller.dart';

class PurchaseSubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseSubscriptionController>(
      () => PurchaseSubscriptionController(),
    );
  }
}
