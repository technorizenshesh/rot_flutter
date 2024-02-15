import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class ResetPasswordMailController extends GetxController {
  final count = 0.obs;
  final isEmail = false.obs;

  FocusNode focusEmail = FocusNode();
  TextEditingController emailController = TextEditingController();

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
    isEmail.value = focusEmail.hasFocus;
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnNextButton() {
    Get.toNamed(Routes.CHECK_YOUR_MAIL);
  }
}
