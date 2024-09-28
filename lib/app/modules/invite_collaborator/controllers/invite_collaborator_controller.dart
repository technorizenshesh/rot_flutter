import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../routes/app_pages.dart';

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
    if (emailController.text.isNotEmpty) {
      Map<String, String> data = {ApiKeyConstants.email: emailController.text};
      Get.toNamed(Routes.INVITE_COLLABORATOR_CHOOSE_A_ROLE, parameters: data);
    } else {
      CommonWidgets.showMyToastMessage('Please enter email id ....');
    }
  }

  clickOnGoBackButton() {}

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
  }
}
