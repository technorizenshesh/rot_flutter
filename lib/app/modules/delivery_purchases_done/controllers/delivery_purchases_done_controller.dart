import 'package:get/get.dart';
import 'package:rot_application/app/routes/app_pages.dart';

class DeliveryPurchasesDoneController extends GetxController {
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
    Get.toNamed(Routes.DELIVERY_ORDER_DETAIL);
  }
}
