import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ChatsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final tabs = [
    const Tab(text: StringConstants.message),
    const Tab(text: StringConstants.notification),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
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

  clickOnMessageTile() {
    Get.toNamed(Routes.CHAT_DETAIL);
  }
}
