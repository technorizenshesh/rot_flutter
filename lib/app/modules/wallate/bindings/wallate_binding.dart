import 'package:get/get.dart';

import '../controllers/wallate_controller.dart';

class WallateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WallateController>(
      () => WallateController(),
    );
  }
}
