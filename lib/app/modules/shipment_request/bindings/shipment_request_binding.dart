import 'package:get/get.dart';

import '../controllers/shipment_request_controller.dart';

class ShipmentRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShipmentRequestController>(
      () => ShipmentRequestController(),
    );
  }
}
