import 'package:get/get.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/routes/app_pages.dart';

class UploadController extends GetxController {
  final count = 0.obs;

  final switchValue = false.obs;

  List list = [
    StringConstants.sell,
    StringConstants.buy,
    StringConstants.exchange,
    StringConstants.rent,
    StringConstants.hire,
  ];

  final selectedValue = StringConstants.sell.obs;

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
