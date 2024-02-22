import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final icPhone = false.obs;

  final isPassword = false.obs;
  final passwordHide = false.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode focusPhone = FocusNode();
  FocusNode focusPassword = FocusNode();

  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    icPhone.value = focusPhone.hasFocus;
    isPassword.value = focusPassword.hasFocus;
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

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }
}
