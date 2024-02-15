import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class ProductDetailController extends GetxController {
  final count = 0.obs;

  final cardIndex = 0.obs;

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

  clickOnBackIcon() {
    Get.back();
  }

  clickOnChat() {}

  clickOnBuyButton() {}

  clickOnReportProduct() {}

  clickOnLearnMoreButton() {}

  clickOnUserProfileTile() {
    Get.toNamed(Routes.PROFILE_PUBLIC);
  }
}