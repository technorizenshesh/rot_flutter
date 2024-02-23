import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordController extends GetxController {
  final count = 0.obs;
  final isPhone = false.obs;
  final inAsyncCall = false.obs;
  final countryCode = '+91'.obs;
  FocusNode focusPhone = FocusNode();

  TextEditingController phoneController = TextEditingController();
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
    isPhone.value = focusPhone.hasFocus;
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
  }

  void increment() => count.value++;

  clickOnCountryCode({required CountryCode value}) {
    countryCode.value = value.toString();
  }

  clickOnNextButton() async {
    if (phoneController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.mobile: phoneController.text,
        ApiKeyConstants.countryCode: countryCode.value,
        ApiKeyConstants.type: ApiKeyConstants.mobile,
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
