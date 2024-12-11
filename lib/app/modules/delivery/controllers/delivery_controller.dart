import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_details_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_shipping_charge_model.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';

class DeliveryController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final count = 0.obs;
  final presentShipment = false.obs;
  final presentUserAddress = false.obs;

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
    // {
    //   'title': '4.99 €',
    //   'subtitle': StringConstants.myAddress.tr,
    //   'icon': IconConstants.icLocation,
    // },
  ];
  List deliveryList = [];

  final selectedDeliveryValue = '0.0'.obs;
  final selectedPhysicalValue = '0.0'.obs;
  final myAddress = ''.obs;
  final userCountryCode = ''.obs;
  final userZipCode = ''.obs;
  final userCountry = ''.obs;
  final userLat = ''.obs;
  final userLon = ''.obs;
  final companyName = ''.obs;
  final deliveryTypeCourier = true.obs;
  int deliveryTypeCourierIndex = -1;
  String userId = '';
  GetShippingChargeModel? getShippingChargeModel;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    getMyAddress();
    increment();
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

  clickOnMyAddress() async {
    var address = await Get.toNamed(Routes.EDIT_ADDRESS);
    myAddress.value = address;
    print("Address :- $address");
    getMyAddress();
  }

  clickOnContinueButton() {
    Map<String, String> data = {
      'shipping_charge': selectedDeliveryValue.value,
      'lat': parameters['lat'] ?? '22.702',
      'lon': parameters['lon'] ?? '75.869',
    };
    if (deliveryTypeCourier.value) {
      if (presentShipment.value) {
        Get.offAndToNamed(Routes.PAYMENT_METHOD,
            arguments: productDetailsModel, parameters: data);
      } else {
        CommonWidgets.showMyToastMessage(
            'Shipment are not present at your zipcode ...');
        showAlertBox();
      }
    } else {
      if (selectedPhysicalValue.value == '3.99 €') {
        Get.toNamed(Routes.DELIVERY_NEARBY_POINTS, parameters: data);
      } else {
        Get.toNamed(Routes.DELIVERY_PURCHASES_STATUS);
      }
    }
  }

  getMyAddress() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
    };
    MyAddressModel? myAddressModel =
        await ApiMethods.getAddressApi(bodyParams: bodyParams);
    if (myAddressModel != null &&
        myAddressModel.status == '1' &&
        myAddressModel.data != null) {
      myAddress.value =
          '${myAddressModel.data![0].street},${myAddressModel.data![0].city},'
          '${myAddressModel.data![0].zipcode},${myAddressModel.data![0].state},${myAddressModel.data![0].country}';
      userLat.value = myAddressModel.data![0].lat != ''
          ? myAddressModel.data![0].lat.toString()
          : '22.7196';
      userLon.value = myAddressModel.data![0].lon != ''
          ? myAddressModel.data![0].lon.toString()
          : '75.8577';
      userCountryCode.value = myAddressModel.data![0].countryCode ?? '';
      userZipCode.value = myAddressModel.data![0].zipcode ?? '';
      userCountry.value = myAddressModel.data![0].country ?? '';
      presentUserAddress.value = true;
      getShippingChargeList();
    } else {
      presentUserAddress.value = false;
    }
    increment();
  }

  Future<void> getShippingChargeList() async {
    try {
      Map<String, dynamic> getShippingChargeParameters = {
        ApiKeyConstants.countryCode: userCountryCode.toString(),
        ApiKeyConstants.zipCode: userZipCode.value.toString(),
        ApiKeyConstants.kg: productDetailsModel.data!.weightDim == 'gr'
            ? '${(double.parse(productDetailsModel.data!.weight != '' ? productDetailsModel.data!.weight ?? '2000' : '2000')) / 1000}'
            : productDetailsModel.data!.weight ?? '2',
      };
      print("bodyParam:-$getShippingChargeParameters");
      getShippingChargeModel = await ApiMethods.getShippingChargeApi(
          queryParameters: getShippingChargeParameters);
      if (getShippingChargeModel != null &&
          getShippingChargeModel!.status == '1') {
        companyName.value = getShippingChargeModel!.data![0].companyName ?? '';
        setCharge(getShippingChargeModel!);
        presentShipment.value = true;
        increment();
      } else {
        presentShipment.value = false;
        CommonWidgets.showMyToastMessage("${getShippingChargeModel!.message}");
      }
      increment();
    } catch (e) {
      presentShipment.value = false;
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage(
          'Shipping charge not available in your country ...');
    }
  }

  setCharge(GetShippingChargeModel model) {
    List<String> typeList = [
      'ExpressPlus Courier',
      'ExpressPlus Courier',
      'Expedited',
      'Standard',
      'Express Freight'
    ];
    List<String> subTitleList = [
      'delivery time 9 to 12 business days',
      'delivery time 9 to 12 business days',
      'delivery time 5 to 7 business days',
      'delivery time of 20 to 45 working days',
      'delivery time of 1 to 3 working days'
    ];
    List<String> titleList = [
      model.data![0].expressPlus ?? '0',
      model.data![0].expressSaver ?? '0',
      model.data![0].expedited ?? '0',
      model.data![0].standard ?? '0',
      model.data![0].expressFreight ?? '0'
    ];

    for (int i = 0; i < 5; i++) {
      if (titleList[i] != '0') {
        deliveryList.add({
          'title': titleList[i],
          'type': typeList[i],
          'subtitle': subTitleList[i],
          'icon': IconConstants.icLocation
        });
      }
    }
    /* deliveryList = [
      {
        'title': model.data![0].expressPlus ?? '0',
        'type': 'ExpressPlus Courier',
        'subtitle': 'delivery time 9 to 12 business days',
        'icon': IconConstants.icLocation
      },
      {
        'subtitle': 'delivery time 9 to 12 business days',
        'type': 'Express Saver',
        'title': model.data![0].expressSaver ?? '0',
        'icon': IconConstants.icLocation
      },
      {
        'title': model.data![0].expedited ?? '0',
        'type': 'Expedited',
        'subtitle': 'delivery time 5 to 7 business days',
        'icon': IconConstants.icLocation,
      },
      {
        'title': model.data![0].standard ?? '0',
        'type': 'Standard',
        'subtitle': 'delivery time of 20 to 45 working days',
        'icon': IconConstants.icLocation,
      },
      {
        'title': model.data![0].expressFreight ?? '0',
        'type': 'Express Freight',
        'subtitle': 'delivery time of 1 to 3 working days',
        'icon': IconConstants.icLocation,
      },
    ];*/
  }

  showAlertBox() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            StringConstants.shipmentAreNotPresentAtYourAddress,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 16.px),
            textAlign: TextAlign.center,
          ),
          //content: Text("Selsec."),
          actions: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                        clickOnMyAddress();
                      },
                      child: Container(
                        height: 45.px,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.px),
                        ),
                        margin: EdgeInsets.only(left: 5.px, right: 5.px),
                        child: Text(
                          'Change Location',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 12.px, color: Colors.white),
                        ),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                      child: Container(
                        height: 45.px,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.px),
                        ),
                        margin: EdgeInsets.only(left: 5.px, right: 5.px),
                        child: Text(
                          'Send Request',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 12.px, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        clickOnChat();
                      }),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  clickOnChat() {
    Map<String, String> detailForChat = {
      'userName': parameters['userName'] ?? '',
      'userImage': productDetailsModel.data!.productImage![0].image ?? '',
      'userAmount': productDetailsModel.data!.price ?? '',
      'otherUserId': productDetailsModel.data!.userId ?? '',
      'userId': userId,
      'request_id': productDetailsModel!.data!.id ?? '',
      'product_status':
          productDetailsModel.data!.userId == userId ? 'Yes' : 'No',
    };
    Get.toNamed(Routes.CHAT_DETAIL, parameters: detailForChat);
  }

  /*openSendRequestScreen() {
    Map<String, String> paramData = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.sellerId: productDetailsModel.data!.userId ?? '',
      ApiKeyConstants.productId: productDetailsModel.data!.id ?? '',
      ApiKeyConstants.zipCode: userZipCode.value,
      ApiKeyConstants.countryCode: userCountryCode.value,
      ApiKeyConstants.country: userCountry.value,
    };
    Get.toNamed(Routes.SHIPMENT_REQUEST, parameters: paramData);
  }*/
}
