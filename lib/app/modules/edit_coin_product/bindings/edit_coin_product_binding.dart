import 'package:get/get.dart';

import '../controllers/edit_coin_product_controller.dart';

class EditCoinProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCoinProductController>(
      () => EditCoinProductController(),
    );
  }
}
