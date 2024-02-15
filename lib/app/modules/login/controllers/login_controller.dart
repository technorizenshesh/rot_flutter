import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final icPhone = false.obs;
  TextEditingController phoneController = TextEditingController();
  FocusNode focusPhone = FocusNode();

  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    icPhone.value = focusPhone.hasFocus;
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

  clickOnLoginButton() {
    Get.toNamed(Routes.NAV_BAR);
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

  clickOnResetPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  clickOnLoginWithEmailButton() {
    Get.toNamed(Routes.LOGIN_WITH_EMAIL);
  }

  clickOnGoogleButton() {}

  clickOnFacebookButton() {}
}
