import 'package:get/get.dart';

import '../controllers/sell_money_review_controller.dart';

class SellMoneyReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellMoneyReviewController>(
      () => SellMoneyReviewController(),
    );
  }
}
