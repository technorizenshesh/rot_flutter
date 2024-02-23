import 'package:country_code_picker/src/country_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_methods/api_methods.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../data/apis/api_models/user_model.dart';
import '../../../routes/app_pages.dart';

class SignUpController extends GetxController {
  final count = 0.obs;

  FocusNode focusFullName = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isFullName = false.obs;
  final isPhoneNumber = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> bodyParams = {};

  final countryCode = '+91'.obs;

  final inAsyncCall = false.obs;

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

  clickOnSignUpButton() async {
    if (fullNameController.text.trim().isNotEmpty &&
        phoneNumberController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.userName: fullNameController.text,
        ApiKeyConstants.countryCode: countryCode.value,
        ApiKeyConstants.mobile: phoneNumberController.text,
        ApiKeyConstants.password: passwordController.text,
        ApiKeyConstants.type: ApiKeyConstants.mobile,
      };
      UserModel? userModel =
          await ApiMethods.userSignup(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.userData != null &&
          userModel.userData!.id != null &&
          userModel.userData!.id!.isNotEmpty) {
        Map<String, String> parameters = {
          ApiKeyConstants.userId: userModel.userData!.id.toString()
        };
        Get.toNamed(Routes.OTP, parameters: parameters);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusPhoneNumber.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  clickOnCancelButton() {}

  clickOnSignUpWithEmailButton() async {
    await Get.toNamed(Routes.SIGN_UP_WITH_EMAIL);
    Get.back();
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }

  clickOnCountryCode({required CountryCode value}) {
    countryCode.value = value.toString();
  }
}
