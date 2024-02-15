import 'package:get/get.dart';

import '../controllers/add_new_account_controller.dart';

class AddNewAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewAccountController>(
      () => AddNewAccountController(),
    );
  }
}
