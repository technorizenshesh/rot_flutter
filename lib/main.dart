import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rot_application/common/common_methods.dart';
import 'package:rot_application/common/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';
import 'common/language_translate.dart';

Future<void> main() async {
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String savedLanguageCode = prefs.getString('languageCode') ?? 'en';
  final String savedCountryCode = prefs.getString('countryCode') ?? 'US';
  final savedLocale = Locale(savedLanguageCode, savedCountryCode);
  WidgetsFlutterBinding.ensureInitialized();
  CommonMethods.unFocsKeyBoard();
  runApp(
    GetMaterialApp(
      title: "Rot Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: MThemeData.themeData(fontFamily: 'Poppins'),
      translations: LanguageTranslate(),
      locale: savedLocale,
      fallbackLocale: const Locale('en', 'US'),
    ),
  );
}
