import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class DeliverySummaryController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final count = 0.obs;

  double lat = 22.702;
  double long = 75.869;
  String userId = '';
  GetProductDetailsModel productDetailsModel = Get.arguments;

  Map<String, dynamic> parameters = Get.parameters;
  final btnLoading = false.obs;

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
  Map<String, dynamic> buyQueryParameters = {};
  final selectedValue = StringConstants.inPerson.tr.obs;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
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
    btnLoading.value = true;
    buyProductDeliveryApi();
  }

  clickOnToEdit() {
    Get.toNamed(Routes.EDIT_ADDRESS);
  }

  Future<void> buyProductDeliveryApi() async {
    try {
      buyQueryParameters = {
        ApiKeyConstants.productId: productDetailsModel.data!.id,
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.amount: productDetailsModel.data!.price,
        ApiKeyConstants.type: 'My address',
        ApiKeyConstants.location: 'indore ,madhya pradesh',
      };
      http.Response? response =
          await ApiMethods.buyProduct(queryParameters: buyQueryParameters);

      if (response != null) {
        Map<String, dynamic> jsonData = jsonDecode(response!.body);
        if (jsonData['status'] == 1) {
          print("Successfully complete.....");
          //data = getProductDetailsModel!.data!;
          Get.toNamed(Routes.DELIVERY_PURCHASES_ON_THE_WAY,
              arguments: productDetailsModel);
        } else {
          print("Failed.....");
        }
      } else {
        print("Failed.....");
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
    }
    btnLoading.value = false;
  }
}
