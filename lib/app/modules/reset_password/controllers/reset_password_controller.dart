import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  final count = 0.obs;
  final isPhone = false.obs;

  FocusNode focusPhone = FocusNode();

  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onFocusChange() {
    isPhone.value = focusPhone.hasFocus;
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnNextButton() {
    Get.toNamed(Routes.OTP);
  }
}
