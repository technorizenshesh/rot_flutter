import 'package:get/get.dart';

import '../controllers/set_product_location_controller.dart';

class SetProductLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetProductLocationController>(
      () => SetProductLocationController(),
    );
  }
}
