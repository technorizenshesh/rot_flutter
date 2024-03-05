import 'package:get/get.dart';

import '../controllers/profile_public_controller.dart';

class ProfilePublicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePublicController>(
      () => ProfilePublicController(),
    );
  }
}
