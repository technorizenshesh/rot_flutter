import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rot_application/app/routes/app_pages.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class DeliverySummaryController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final count = 0.obs;

  double lat = 22.702;
  double long = 75.869;

  Map<String, dynamic> parameters = Get.parameters;

  List list = [
    {
      'title': 'Stimulated delivery in 3-7 days ',
      'subtitle':
          'PS CLOSER TELECOM, Plaza\nBatallas 3-LOCAL 2, 47005\nValladolid, Spain',
      'icon': IconConstants.icLocation,
    },
    {
      'subtitle': 'Card **** **** 4744',
      'title': 'Payment method',
      'icon': IconConstants.icCardPayment,
    },
    {
      'title': 'Promotional code',
      'subtitle': StringConstants.myAddress.tr,
      'icon': IconConstants.icPromotionalCode,
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

  clickOnContinueButton() {
    Get.toNamed(Routes.DELIVERY_PURCHASES_ON_THE_WAY);
  }

  clickOnToEdit() {
    Get.toNamed(Routes.EDIT_ADDRESS);
  }
}
