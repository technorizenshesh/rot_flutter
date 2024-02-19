import 'package:get/get.dart';

import '../controllers/delivery_nearby_points_controller.dart';

class DeliveryNearbyPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryNearbyPointsController>(
      () => DeliveryNearbyPointsController(),
    );
  }
}
