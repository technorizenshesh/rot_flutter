import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_methods.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class SalesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;

  late TabController tabController;
  final tabs = [
    const Tab(text: StringConstants.inWind),
    const Tab(text: StringConstants.inProgress),
    const Tab(text: StringConstants.finished),
  ];

  List listOfCards = [
    {
      'title': 'electric kettle',
      'price': '${CommonMethods.cur}29.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image1.png',
    },
    {
      'title': 'boAt Rockerz 551 ANC...',
      'price': '${CommonMethods.cur}20.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image2.png',
    },
    {
      'title': 'Badminton',
      'price': '${CommonMethods.cur}05.00',
      'subTitle': 'Rua dos Ingleses, 355 - Bela Vista 01327-000',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image3.png',
    },
    {
      'title': 'Canon D7500 DSLR Camera Body',
      'price': '${CommonMethods.cur}449.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image4.png',
    },
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

  clickOnCard({required int index}) {}
}
