import 'package:get/get.dart';

import '../controllers/my_qr_code_controller.dart';

class MyQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyQrCodeController>(
      () => MyQrCodeController(),
    );
  }
}
