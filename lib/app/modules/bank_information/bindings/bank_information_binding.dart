import 'package:get/get.dart';

import '../controllers/bank_information_controller.dart';

class BankInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankInformationController>(
      () => BankInformationController(),
    );
  }
}
