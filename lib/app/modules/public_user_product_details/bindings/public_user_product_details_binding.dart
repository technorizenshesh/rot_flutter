import 'package:get/get.dart';

import '../controllers/public_user_product_details_controller.dart';

class PublicUserProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicUserProductDetailsController>(
      () => PublicUserProductDetailsController(),
    );
  }
}
