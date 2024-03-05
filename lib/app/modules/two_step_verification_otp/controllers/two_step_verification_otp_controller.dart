import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoStepVerificationOtpController extends GetxController {
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

  clickOnContinueButton() {}

  clickOnResendCodeButton() {}
}
