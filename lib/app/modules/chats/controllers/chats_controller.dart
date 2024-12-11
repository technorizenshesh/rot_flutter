import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_notification_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_simple_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/check_permission.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_conversation_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ChatsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  final totalChatCount = 0.obs;
  final tabIndex = 0.obs;
  final totalNotificationCount = 0.obs;
//  late TabController tabController;
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
    // tabController = TabController(length: 2, vsync: this);
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
    // tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  checkUserType(int index) async {
    bool youAreUser = LocalData.userType;
    if (youAreUser) {
      clickOnMessageTile(index);
    } else {
      bool result = await CheckScreenPermission.checkPermission('10', '27');
      if (result) {
        clickOnMessageTile(index);
      } else {
        CommonWidgets.showMyToastMessage(
            StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
      }
    }
  }

  clickOnMessageTile(int index) async {
    Map<String, String> detailForChat = {
      'userName': getConversationList[index].userName ?? '',
      'userImage': getConversationList[index].productImage ?? '',
      'userAmount': getConversationList[index].userName ?? '',
      'otherUserId': getConversationList[index].id ?? '',
      'userId': userId,
      'request_id': getConversationList[index].productId ?? '',
      'product_status': getConversationList[index].productStatus ?? 'No',
    };
    await Get.toNamed(Routes.CHAT_DETAIL, parameters: detailForChat);
    if (getConversationList[index].noOfMessage != 0) {
      inAsyncCall.value = true;
      await getConversationListApi();
      inAsyncCall.value = false;
      increment();
    }
  }

  Future<void> getConversationListApi() async {
    getConversationList.clear();
    Map<String, dynamic> getChatParameters = {
      ApiKeyConstants.receiverId: userId
    };
    GetConversationModel? getConversationModel =
        await ApiMethods.getConversationList(bodyParams: getChatParameters);
    if (getConversationModel != null &&
        getConversationModel.result != null &&
        getConversationModel.result!.isNotEmpty) {
      getConversationList = getConversationModel.result!;
      for (int i = 0; i < getConversationList.length; i++) {
        if (getConversationList[i].noOfMessage != 0) {
          totalChatCount.value =
              totalChatCount.value + (getConversationList[i].noOfMessage ?? 1);
        }
      }
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
      totalNotificationCount.value = notificationModel.notificationCount ?? 0;
    }
  }

  Future<void> callingSeeAllNotificationApi() async {
    getConversationList.clear();
    Map<String, dynamic> getChatParameters = {ApiKeyConstants.userId: userId};
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.seeAllNotificationApi(bodyParams: getChatParameters);
    if (simpleResponseModel != null && simpleResponseModel.status != 1) {
      print('Success.....');
    } else {
      print('Failed.....');
    }
  }
}
