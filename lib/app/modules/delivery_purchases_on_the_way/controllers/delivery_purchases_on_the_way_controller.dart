import 'package:get/get.dart';
import 'package:rot_application/app/routes/app_pages.dart';

class DeliveryPurchasesOnTheWayController extends GetxController {
  //TODO: Implement DeliveryPurchasesOnTheWayController

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

  clickOnKnowMore() {
    Get.toNamed(Routes.DELIVERY_PURCHASES_DONE);
  }
}
