import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_details_model.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/app/routes/app_pages.dart';

class DeliveryController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final count = 0.obs;

  double lat = 22.702;
  double long = 75.869;

  Map<String, dynamic> parameters = Get.parameters;
  GetProductDetailsModel productDetailsModel = Get.arguments;

  List list = [
    {
      'title': StringConstants.inPerson.tr,
      'subtitle': StringConstants.meetAndPay.tr,
      'icon': IconConstants.icInPerson,
    },
    {
      'subtitle': StringConstants.pickUpPoint.tr,
      'title': '3.99 €',
      'icon': IconConstants.icRouting,
    },
    {
      'title': '4.99 €',
      'subtitle': StringConstants.myAddress.tr,
      'icon': IconConstants.icLocation,
    },
  ];

  final selectedValue = StringConstants.inPerson.tr.obs;

  @override
  void onInit() {
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

  clickOnSearchButton() {
    Get.toNamed(Routes.ADD_DELIVERY_ADDRESS);
  }

  clickOnContinueButton() {
    switch (selectedValue.value) {
      case StringConstants.inPerson:
        Get.toNamed(Routes.DELIVERY_NEARBY_POINTS);
      case '3.99 €':
        Get.toNamed(Routes.DELIVERY_PURCHASES_STATUS);
      case '4.99 €':
        Get.toNamed(Routes.DELIVERY_SUMMARY, arguments: productDetailsModel);
    }
  }
}
