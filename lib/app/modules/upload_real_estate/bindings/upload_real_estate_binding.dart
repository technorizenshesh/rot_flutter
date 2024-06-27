import 'package:get/get.dart';

import '../controllers/upload_real_estate_controller.dart';

class UploadRealEstateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadRealEstateController>(
      () => UploadRealEstateController(),
    );
  }
}
