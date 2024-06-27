import 'package:get/get.dart';

import '../controllers/edit_real_estate_controller.dart';

class EditRealEstateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditRealEstateController>(
      () => EditRealEstateController(),
    );
  }
}
