import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_chat_model.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class ChatDetailController extends GetxController {
  TextEditingController messageController = TextEditingController();
  final count = 0.obs;
  String userImage = '';
  String userName = '';
  String userAmount = '';
  String otherUserId = '';
  String userId = '';
  Map<String, String?> parameters = Get.parameters;
  final textMessageLoading = false.obs;
  final messageLoading = true.obs;
  List<ChatResult> chatResultList = [];
  @override
  void onInit() {
    super.onInit();
    userName = parameters['userName'] ?? '';
    userImage = parameters['userImage'] ?? '';
    userAmount = parameters['userAmount'] ?? '';
    otherUserId = parameters['otherUserId'] ?? '';
    userId = parameters['userId'] ?? '';
    getChatApi();
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

  clickOnViewButton() {
    Get.toNamed(Routes.PURCHASES_STATUS);
  }

  Future<void> getChatApi() async {
    Map<String, dynamic> getChatParameters = {
      ApiKeyConstants.senderId: otherUserId,
      ApiKeyConstants.receiverId: userId
    };
    GetChatModel? getChatModel =
        await ApiMethods.getChat(bodyParams: getChatParameters);
    if (getChatModel != null &&
        getChatModel.result != null &&
        getChatModel.result!.isNotEmpty) {
      chatResultList = getChatModel.result!;
    }
    messageLoading.value = false;
  }

  Future<void> insertChatApi(String text) async {
    Map<String, dynamic> insertChatParameters = {
      ApiKeyConstants.senderId: userId,
      ApiKeyConstants.receiverId: otherUserId,
      ApiKeyConstants.chatMessage: text,
    };
    http.Response? response =
        await ApiMethods.insertChat(bodyParams: insertChatParameters);
    print("response:-${response!.body.toString()}");
    if (response != null) {
      getChatApi();
    } else {
      CommonWidgets.showMyToastMessage('Send message failed ...');
    }
    textMessageLoading.value = false;
  }
}
