import 'package:get/get.dart';

import '../controllers/edit_car_product_controller.dart';

class EditCarProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCarProductController>(
      () => EditCarProductController(),
    );
  }
}
