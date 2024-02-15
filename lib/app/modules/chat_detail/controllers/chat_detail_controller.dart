import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class ChatDetailController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnViewButton() {
    Get.toNamed(Routes.PURCHASES_STATUS);
  }
}
