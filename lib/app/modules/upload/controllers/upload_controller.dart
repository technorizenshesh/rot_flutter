import 'package:get/get.dart';

import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class UploadController extends GetxController {
  final count = 0.obs;

  final switchValue = false.obs;

  List list = [
    StringConstants.sell.tr,
    StringConstants.buy.tr,
    StringConstants.exchange.tr,
    StringConstants.rent.tr,
    StringConstants.hire.tr,
  ];

  final selectedValue = StringConstants.sell.tr.obs;

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

  clickOnCard({required int index}) {}

  clickOnPostAddButton() {}

  clickOnProductsStatus() {
    Get.toNamed(Routes.PRODUCTS_STATUS);
  }

  clickOnHashtag() {
    Get.toNamed(Routes.HASHTAG);
  }
}
