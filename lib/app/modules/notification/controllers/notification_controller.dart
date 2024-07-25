import 'package:get/get.dart';

class NotificationController extends GetxController {
  final count = 0.obs;

  final expiredSwitchValue = false.obs;
  final searchSwitchValue = false.obs;
  final priceSwitchValue = false.obs;
  final favoritesSoldSwitchValue = false.obs;
  final favoritesReservedSwitchValue = false.obs;
  final newProductSwitchValue = false.obs;
  final tripSwitchValue = false.obs;
  final promotionSwitchValue = false.obs;
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
}
