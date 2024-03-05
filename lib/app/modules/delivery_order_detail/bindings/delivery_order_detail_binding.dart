import 'package:get/get.dart';

import '../controllers/delivery_order_detail_controller.dart';

class DeliveryOrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryOrderDetailController>(
      () => DeliveryOrderDetailController(),
    );
  }
}
