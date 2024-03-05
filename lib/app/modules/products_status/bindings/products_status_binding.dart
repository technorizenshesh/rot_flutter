import 'package:get/get.dart';

import '../controllers/products_status_controller.dart';

class ProductsStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsStatusController>(
      () => ProductsStatusController(),
    );
  }
}
