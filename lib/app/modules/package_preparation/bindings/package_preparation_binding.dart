import 'package:get/get.dart';

import '../controllers/package_preparation_controller.dart';

class PackagePreparationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackagePreparationController>(
      () => PackagePreparationController(),
    );
  }
}
