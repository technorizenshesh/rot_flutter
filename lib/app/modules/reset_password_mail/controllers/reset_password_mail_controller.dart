import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordMailController extends GetxController {
  final count = 0.obs;
  final isEmail = false.obs;
  final inAsyncCall = false.obs;

  FocusNode focusEmail = FocusNode();
  TextEditingController emailController = TextEditingController();
  Map<String, dynamic> bodyParams = {};

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

  clickOnNextButton() async {
    if (emailController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.email: emailController.text,
        ApiKeyConstants.type: ApiKeyConstants.email,
      };
      UserModel? userModel =
          await ApiMethods.forgetPassword(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.userData != null &&
          userModel.userData!.id != null &&
          userModel.userData!.id!.isNotEmpty) {
        Map<String, String> parameters = {
          ApiKeyConstants.userId: userModel.userData!.id.toString(),
          ApiKeyConstants.type: StringConstants.resetPassword,
        };
        Get.toNamed(Routes.OTP, parameters: parameters);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
