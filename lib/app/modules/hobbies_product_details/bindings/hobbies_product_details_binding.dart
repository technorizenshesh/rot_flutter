import 'package:get/get.dart';

import '../controllers/hobbies_product_details_controller.dart';

class HobbiesProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HobbiesProductDetailsController>(
      () => HobbiesProductDetailsController(),
    );
  }
}
