import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_conversation_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ChatsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final tabs = [
    Tab(text: StringConstants.message.tr),
    Tab(text: StringConstants.notification.tr),
  ];
  String userId = '';
  final inAsyncCall = false.obs;
  List<GetConversationResult> getConversationList = [];
  List<NotificationData> notificationList = [];

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    inAsyncCall.value = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    await getConversationListApi();
    await getNotificationApi();
    inAsyncCall.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  clickOnMessageTile(int index) {
    Map<String, String> detailForChat = {
      'userName': getConversationList[index].userName ?? '',
      'userImage': getConversationList[index].image ?? '',
      'userAmount': getConversationList[index].userName ?? '',
      'otherUserId': getConversationList[index].id ?? '',
      'userId': userId
    };
    Get.toNamed(Routes.CHAT_DETAIL, parameters: detailForChat);
  }

  Future<void> getConversationListApi() async {
    Map<String, dynamic> getChatParameters = {
      ApiKeyConstants.receiverId: userId
    };
    GetConversationModel? getConversationModel =
        await ApiMethods.getConversationList(bodyParams: getChatParameters);
    if (getConversationModel != null &&
        getConversationModel.result != null &&
        getConversationModel.result!.isNotEmpty) {
      getConversationList = getConversationModel.result!;
    }
  }

  Future<void> getNotificationApi() async {
    Map<String, dynamic> getNotification = {ApiKeyConstants.userId: userId};
    NotificationModel? notificationModel =
        await ApiMethods.getNotification(queryParameters: getNotification);
    if (notificationModel != null &&
        notificationModel.data != null &&
        notificationModel.data!.isNotEmpty) {
      notificationList = notificationModel.data!;
    }
  }
}
