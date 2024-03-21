import 'package:get/get.dart';
import 'package:rot_application/app/routes/app_pages.dart';

import '../../../data/apis/api_models/get_card_list_model.dart';

class RechargeSummaryController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  CardListData cardListData = Get.arguments;
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
