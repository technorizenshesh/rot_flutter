import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  SharedPreferences? prefs;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
    await manageSession();
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

  manageSession() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        if (prefs?.getString(ApiKeyConstants.token) == null ||
            prefs?.getString(ApiKeyConstants.token) != '') {
          Get.offAllNamed(Routes.NAV_BAR);
        } else {
          Get.offAndToNamed(Routes.GET_START);
        }
      },
    );
  }
}
