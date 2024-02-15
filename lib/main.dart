import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/common/common_methods.dart';
import 'package:rot/common/theme_data.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CommonMethods.unFocsKeyBoard();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: MThemeData.themeData(fontFamily: 'Poppins'),
    ),
  );
}
