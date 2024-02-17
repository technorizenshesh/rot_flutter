import 'package:get/get.dart';
import 'package:rot_application/app/routes/app_pages.dart';

class RechargeSummaryController extends GetxController {
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

  clickOnRecharge() {
    Get.toNamed(Routes.RECHARGE_DONE);
  }
}
