import 'package:get/get.dart';

import '../controllers/upload_car_sub_category_controller.dart';

class UploadCarSubCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadCarSubCategoryController>(
      () => UploadCarSubCategoryController(),
    );
  }
}
