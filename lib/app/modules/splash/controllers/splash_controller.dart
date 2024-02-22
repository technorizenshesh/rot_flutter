import 'package:get/get.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  List listOfLanguages = [
    {'title': StringConstants.english.tr, 'icon': IconConstants.icEnglish.tr},
    {'title': StringConstants.spanish.tr, 'icon': IconConstants.icSpanish.tr},
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

  clickOnEnglish() async {
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', 'en');
    prefs.setString('countryCode', 'US');
    final String savedLanguageCode = prefs.getString('languageCode') ?? 'en';
    final String savedCountryCode = prefs.getString('countryCode') ?? 'US';
    Get.updateLocale(Locale(savedLanguageCode, savedCountryCode));*/
    Get.toNamed(Routes.LOGIN);
  }

  clickOnSpanish() async {
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', 'es');
    prefs.setString('countryCode', 'US');
    final String savedLanguageCode = prefs.getString('languageCode') ?? 'es';
    final String savedCountryCode = prefs.getString('countryCode') ?? 'US';
    Get.updateLocale(Locale(savedLanguageCode, savedCountryCode));*/
    Get.toNamed(Routes.LOGIN);
  }
}
