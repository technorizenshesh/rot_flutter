import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class OtpController extends GetxController {
  final count = 0.obs;

  TextEditingController pin = TextEditingController();

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

  clickOnNextButton() {
    Get.toNamed(Routes.CREATE_NEW_PASSWORD);
  }
}
