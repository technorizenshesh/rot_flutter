import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryNearbyPointsController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final count = 0.obs;

  final lat = '22.702'.obs;
  final long = '75.869'.obs;

  Map<String, dynamic> parameters = Get.parameters;

  @override
  void onInit() {
    super.onInit();
    if (parameters['lat'] != '' && parameters['lon'] != '') {
      lat.value = parameters['lat'];
      long.value = parameters['lon'];
      increment();
    }
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
