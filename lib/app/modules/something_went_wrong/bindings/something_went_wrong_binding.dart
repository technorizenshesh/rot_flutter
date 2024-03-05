import 'package:get/get.dart';

import '../controllers/something_went_wrong_controller.dart';

class SomethingWentWrongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SomethingWentWrongController>(
      () => SomethingWentWrongController(),
    );
  }
}
