import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class CreateNewPasswordController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  final isNewPassword = false.obs;
  final isConfirmPassword = false.obs;

  FocusNode focusNewPassword = FocusNode();
  FocusNode focusConfirmPassword = FocusNode();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;

  String userId = '';
  Map<String, String?> parameters = Get.parameters;

  Map<String, dynamic> bodyParams = {};

  @override
  void onInit() {
    userId = parameters[ApiKeyConstants.userId] ?? '';
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
    isNewPassword.value = focusNewPassword.hasFocus;
    isConfirmPassword.value = focusConfirmPassword.hasFocus;
  }

  void startListener() {
    focusNewPassword.addListener(onFocusChange);
    focusConfirmPassword.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnSubmitButton() async {
    if (newPasswordController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty) {
      if (newPasswordController.text.trim() ==
          confirmPasswordController.text.trim()) {
        if (userId.isNotEmpty) {
          bodyParams = {
            ApiKeyConstants.password: newPasswordController.text,
            ApiKeyConstants.userId: userId,
          };
          inAsyncCall.value = true;
          UserModel? userModel =
              await ApiMethods.createNewPassword(bodyParams: bodyParams);
          if (userModel != null &&
              userModel.token != null &&
              userModel.token!.isNotEmpty) {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString(ApiKeyConstants.token, userModel.token!);
            Get.toNamed(Routes.NAV_BAR);
          }
          inAsyncCall.value = false;
        }
      } else {
        CommonWidgets.snackBarView(title: StringConstants.passwordNotMatch);
      }
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  clickOnEyeNewPasswordButton() {
    hideNewPassword.value = !hideNewPassword.value;
  }

  clickOnEyeConfirmPasswordButton() {
    hideConfirmPassword.value = !hideConfirmPassword.value;
  }
}
