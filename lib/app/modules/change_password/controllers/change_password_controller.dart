import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ChangePasswordController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  final isCurrentPassword = false.obs;
  final currentPasswordHide = false.obs;
  TextEditingController currentPasswordController = TextEditingController();
  FocusNode focusCurrentPassword = FocusNode();

  final isNewPassword = false.obs;
  final newPasswordHide = false.obs;
  TextEditingController newPasswordController = TextEditingController();
  FocusNode focusNewPassword = FocusNode();

  final isConfirmPassword = false.obs;
  final confirmPasswordHide = false.obs;
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode focusConfirmPassword = FocusNode();

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

  void startListener() {
    focusCurrentPassword.addListener(onFocusChange);
    focusNewPassword.addListener(onFocusChange);
    focusConfirmPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCurrentPassword.value = focusCurrentPassword.hasFocus;
    isNewPassword.value = focusNewPassword.hasFocus;
    isConfirmPassword.value = focusConfirmPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnSaveButton() async {
    if (currentPasswordController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.userName: currentPasswordController.text,
        ApiKeyConstants.userId: userId,
      };
      UserModel? userModel =
          await ApiMethods.userSignup(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.userData != null &&
          userModel.token != null &&
          userModel.token!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.token!);
        Get.toNamed(Routes.NAV_BAR);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  clickOnCurrentPasswordEyeButton() {
    currentPasswordHide.value = !currentPasswordHide.value;
  }

  clickOnNewPasswordEyeButton() {
    newPasswordHide.value = !newPasswordHide.value;
  }

  clickOnConfirmPasswordEyeButton() {
    confirmPasswordHide.value = !confirmPasswordHide.value;
  }
}
