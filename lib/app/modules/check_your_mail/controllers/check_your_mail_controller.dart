import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class CheckYourMailController extends GetxController {
  final count = 0.obs;

  TextEditingController pin = TextEditingController();

  Map<String, String> bodyParams = {};

  final inAsyncCall = false.obs;
  String userId = '';
  Map<String, String?> parameters = Get.parameters;

  @override
  void onInit() {
    userId = parameters[ApiKeyConstants.userId] ?? '';
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

  clickOnNextButton() async {
    if (pin.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.otp: pin.text,
        ApiKeyConstants.userId: userId,
      };
      UserModel? userModel =
          await ApiMethods.userVerification(bodyParams: bodyParams);
      if (userModel != null) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.token!);
        Get.toNamed(Routes.NAV_BAR);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
