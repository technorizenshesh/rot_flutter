import 'package:get/get.dart';

import '../controllers/products_according_category_controller.dart';

class ProductsAccordingCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsAccordingCategoryController>(
      () => ProductsAccordingCategoryController(),
    );
  }
}
