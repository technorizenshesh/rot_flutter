import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpWithEmailController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;

  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isFullName = false.obs;
  final isEmail = false.obs;
  final isPassword = false.obs;
  final passwordHide = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() {
    // Get.toNamed(Routes.LOGIN);
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
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  clickOnCancelButton() {}

  clickOnSignUpWithPhoneButton() {
    Get.back();
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }
}
