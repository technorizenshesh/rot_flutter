import 'package:get/get.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  List listOfLanguages = [
    {'title': StringConstants.english, 'icon': IconConstants.icEnglish},
    {'title': StringConstants.spanish, 'icon': IconConstants.icSpanish},
  ];

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

  clickOnEnglish() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
