import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/get_token_model.dart';
import '../../../data/constants/string_constants.dart';

class DeliverySummaryController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  final deliveryAddress = 'address'.obs;
  final count = 0.obs;

  double lat = 22.702;
  double long = 75.869;
  String userId = '';
  GetProductDetailsModel productDetailsModel = Get.arguments;

  Map<String, dynamic> parameters = Get.parameters;
  final btnLoading = false.obs;
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
    if (parameters['method'] == 'Card') {
      getTokenForBuyProduct();
    } else {
      buyProductDeliveryApi('');
    }
  }

  clickOnToEdit(int index) async {
    if (index == 1) {
      Get.back();
    } else {
      String address = await Get.toNamed(Routes.EDIT_ADDRESS);
      deliveryAddress.value = address;
    }
  }

  Future<void> getTokenForBuyProduct() async {
    try {
      Map<String, dynamic> getTokenParameters = {
        ApiKeyConstants.cardNumber: parameters['card_number'],
        ApiKeyConstants.expiryMonth: parameters['expire_Date'].substring(0, 2),
        ApiKeyConstants.expiryYear:
            '20${parameters['expire_Date'].substring(3, 5)}',
        ApiKeyConstants.cvcCode: parameters['cvcCode'],
      };
      print("bodyParamForToken:-$getTokenParameters");
      TokenModel? tokenModel =
          await ApiMethods.getTokenApi(bodyParams: getTokenParameters);
      if (tokenModel != null &&
          tokenModel.status == '1' &&
          tokenModel.data != null) {
        buyProductDeliveryApi(tokenModel.data!.id!);
        print('Successfully completed....');
      } else {
        print('Failed to get token....');
        CommonWidgets.showMyToastMessage('Your card number is incorrect...');
        btnLoading.value = false;
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Your card number is incorrect...');
      btnLoading.value = false;
    }
  }

  Future<void> buyProductDeliveryApi(String token) async {
    try {
      buyQueryParameters = {
        ApiKeyConstants.productId: productDetailsModel.data!.id,
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.amount: productDetailsModel.data!.price,
        ApiKeyConstants.type: 'My address',
        ApiKeyConstants.location: deliveryAddress.value,
        ApiKeyConstants.paymentType: parameters['method'],
        ApiKeyConstants.token: token
      };
      http.Response? response =
          await ApiMethods.buyProduct(queryParameters: buyQueryParameters);

      if (response != null) {
        Map<String, dynamic> jsonData = jsonDecode(response!.body);
        if (jsonData['status'] == "1") {
          print("Successfully complete.....");
          //data = getProductDetailsModel!.data!;
          Get.offAndToNamed(Routes.DELIVERY_PURCHASES_ON_THE_WAY,
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
