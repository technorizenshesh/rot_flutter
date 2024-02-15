import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class InviteCollaboratorController extends GetxController {
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

  void increment() => count.value++;

  clickOnContinueButton() {
    Get.toNamed(Routes.INVITE_COLLABORATOR_CHOOSE_A_ROLE);
  }

  clickOnGoBackButton() {}

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
  }
}
