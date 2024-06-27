import 'package:get/get.dart';

import '../controllers/upload_hobbies_leisure_controller.dart';

class UploadHobbiesLeisureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadHobbiesLeisureController>(
      () => UploadHobbiesLeisureController(),
    );
  }
}
