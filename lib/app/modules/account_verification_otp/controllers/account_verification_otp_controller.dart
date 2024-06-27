import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/user_model.dart';
import 'package:rot_application/app/routes/app_pages.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/response_model.dart';
import '../../../data/constants/string_constants.dart';

class AccountVerificationOtpController extends GetxController {
  final count = 0.obs;
  TextEditingController pin = TextEditingController();

  Map<String, String> bodyParams = {};

  final inAsyncCall = false.obs;
  String userId = '';
  String type = '';
  String from = '';
  Map<String, String?> parameters = Get.parameters;

  @override
  void onInit() {
    userId = parameters[ApiKeyConstants.userId] ?? '';
    type = parameters[ApiKeyConstants.type] ?? '';
    from = parameters['From'] ?? '';
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
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
      };
      UserModel? userModel = await ApiMethods.checkOtpForAccountVerificationApi(
          bodyParams: bodyParams);
      if (userModel != null && userModel.status == '1') {
        createLocalAccount();
      } else {
        CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
      }
      inAsyncCall.value = false;
    }
  }

  createLocalAccount() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
      ApiKeyConstants.id: parameters[ApiKeyConstants.id],
      ApiKeyConstants.recipient: parameters[ApiKeyConstants.recipient],
      ApiKeyConstants.were: parameters[ApiKeyConstants.were],
      ApiKeyConstants.swiptCode: parameters[ApiKeyConstants.swiptCode],
      ApiKeyConstants.bankName: parameters[ApiKeyConstants.bankName],
      ApiKeyConstants.phone: parameters[ApiKeyConstants.phone],
      ApiKeyConstants.countryCode: parameters[ApiKeyConstants.countryCode],
      ApiKeyConstants.email: parameters[ApiKeyConstants.email],
      ApiKeyConstants.type: parameters[ApiKeyConstants.type],
    };

    print("parameters:-${bodyParams}");
    ResponseModel? responseModel =
        await ApiMethods.createLocalInternationalAccount(
      queryParameters: bodyParams,
    );
    if (responseModel != null && responseModel.status == 1) {
      CommonWidgets.showMyToastMessage(responseModel.messages ?? '');
      Get.offNamedUntil(Routes.ACCOUNTS, (route) => false);
    } else {
      CommonWidgets.showMyToastMessage(responseModel!.messages ?? '');
    }
    inAsyncCall.value = false;
  }
}
