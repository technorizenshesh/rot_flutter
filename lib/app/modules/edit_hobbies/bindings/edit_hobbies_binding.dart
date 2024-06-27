import 'package:get/get.dart';

import '../controllers/edit_hobbies_controller.dart';

class EditHobbiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditHobbiesController>(
      () => EditHobbiesController(),
    );
  }
}
