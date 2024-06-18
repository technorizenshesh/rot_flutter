import 'package:get/get.dart';
import 'package:rot_application/app/routes/app_pages.dart';

import '../../../data/apis/api_models/get_product_details_model.dart';

class DeliveryPurchasesDoneController extends GetxController {
  GetProductDetailsModel productDetailsModel = Get.arguments;
  Map<String, String?> parameters = Get.parameters;
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
    Map<String, String> data = {
      "shipping_id": parameters['shipping_id'] ?? '0',
      "shipping_charge": parameters['shipping_charge'] ?? '0'
    };
    Get.toNamed(Routes.DELIVERY_ORDER_DETAIL);
  }

  clickOnHomeButton() {
    Get.offNamedUntil(Routes.NAV_BAR, (route) => false);
  }
}
