import 'package:get/get.dart';

import '../controllers/linked_devices_controller.dart';

class LinkedDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LinkedDevicesController>(
      () => LinkedDevicesController(),
    );
  }
}
