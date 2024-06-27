import 'package:get/get.dart';

import '../controllers/upload_coin_backnotes_controller.dart';

class UploadCoinBacknotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadCoinBacknotesController>(
      () => UploadCoinBacknotesController(),
    );
  }
}
