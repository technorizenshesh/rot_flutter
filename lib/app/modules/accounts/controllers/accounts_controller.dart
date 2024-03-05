import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';

import '../../../data/constants/string_constants.dart';

class AccountsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final tabs = [
    Tab(text: StringConstants.local.tr),
    Tab(text: StringConstants.swift.tr),
  ];

  List listOfData = [
    {'title': StringConstants.recipient.tr, 'subtitle': 'Maikel Alexander'},
    {
      'title': StringConstants.were.tr,
      'subtitle': 'ES09 15830001 1490 7882 2878'
    },
    {'title': StringConstants.bicSwiftCode.tr, 'subtitle': 'REVOESM2'},
    {
      'title': StringConstants.bankNameAndAddress.tr,
      'subtitle':
          'Revolut Bank UAB c Serrano 20, 1. dcha., 28001, Madrid, Spain'
    },
  ];

  List listOfDataLocal = [
    {'title': StringConstants.useThisData.tr, 'icon': IconConstants.icIdea},
    {
      'title': StringConstants.provideThisData.tr,
      'icon': IconConstants.icEarth
    },
    {
      'title': StringConstants.ifTheIssuingBank.tr,
      'icon': IconConstants.icTime
    },
    {'title': StringConstants.ifYourEmployer.tr, 'icon': IconConstants.icFlag},
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
    super.onClose();
  }

  void increment() => count.value++;

  clickOnShareButton() {}
}
