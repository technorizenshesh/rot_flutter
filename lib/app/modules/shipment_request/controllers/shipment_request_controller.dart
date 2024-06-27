import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class ShipmentRequestController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  final isDescription = false.obs;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  FocusNode focusDescription = FocusNode();
  Map<String, String?> parameters = Get.parameters;

  Map<String, dynamic> bodyParams = {};

  @override
  void onInit() {
    super.onInit();
    productNameController.text = parameters[ApiKeyConstants.fullName] ?? '';
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
    focusDescription.addListener(onFocusChange);
  }

  void onFocusChange() {
    isDescription.value = focusDescription.hasFocus;
  }

  void increment() => count.value++;

  clickOnSendRequestButton() async {
    if (descriptionController.text.isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.sellerId: parameters[ApiKeyConstants.sellerId],
        ApiKeyConstants.productId: parameters[ApiKeyConstants.productId],
        ApiKeyConstants.message: descriptionController.text,
      };
      http.Response? response =
          await ApiMethods.addReportProduct(bodyParams: bodyParams);
      if (response!.statusCode == 200 && response != null) {
        print('Suceesfully complete....');
        CommonWidgets.showMyToastMessage(
            "Successfully send report product ...");
      }

      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
