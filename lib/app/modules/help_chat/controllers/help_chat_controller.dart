import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class HelpChatController extends GetxController {
  TextEditingController messageController = TextEditingController();
  final inAsyncCall = false.obs;
  Map<String, String?> bodyParams = {};
  String userId = '';
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
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

  clickOnSubmitButton() async {
    if (messageController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.message: messageController.text.toString()
      };
      try {
        http.Response? response =
            await ApiMethods.submitHelpChat(queryParameters: bodyParams);
        if (response != null) {
          messageController.value = const TextEditingValue(text: '');
          CommonWidgets.snackBarView(title: 'Thank for your message.');
        }
      } catch (e) {
        messageController.value = const TextEditingValue(text: '');
        CommonWidgets.snackBarView(title: 'Thank for your message.');
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'Please enter message ...');
    }
  }
}
