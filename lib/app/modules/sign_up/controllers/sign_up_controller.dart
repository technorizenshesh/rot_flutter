import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;

  FocusNode focusFullName = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isFullName = false.obs;
  final isPhoneNumber = false.obs;
  final isPassword = false.obs;
  final passwordHide = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    isFullName.value = focusFullName.hasFocus;
    isPhoneNumber.value = focusPhoneNumber.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() {
    Get.back();
  }

  clickOnSignUpButton() {
    // Get.toNamed(Routes.NAV_BAR);
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusPhoneNumber.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  clickOnCancelButton() {}

  clickOnSignUpWithEmailButton() {
    Get.toNamed(Routes.SIGN_UP_WITH_EMAIL);
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }
}
