import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/string_constants.dart';

class HistoryOfMovementsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final tabs = [
    Tab(text: StringConstants.all.tr),
    Tab(text: StringConstants.appetizer.tr),
    Tab(text: StringConstants.departures.tr),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
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
}
