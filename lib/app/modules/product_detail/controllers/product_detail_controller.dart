import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_details_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/check_permission.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_profile_public_model.dart';
import '../../../data/apis/api_models/get_shipping_charge_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ProductDetailController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  GetShippingChargeModel? getShippingChargeModel;

  final count = 0.obs;
  final lat = 22.7196.obs;
  final lon = 75.8577.obs;
  final userLat = '22.7196'.obs;
  final userLon = '75.8577'.obs;
  final userCountryCode = ''.obs;
  final userZipCode = ''.obs;
  final userCountry = ''.obs;
  final deliveryCharge = '3.49'.obs;
  final deliveryTime = 'Delivery in 3-7 business days'.obs;
  final cardIndex = 0.obs;
  final myAddress = ''.obs;
  final companyName = ''.obs;
  String productId = '';
  String userId = '';
  String otherUserId = '';
  Map<String, String?> parameters = Get.parameters;
  final inAsyncCall = false.obs;
  final presentUserAddress = false.obs;
  final presentShipment = false.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, dynamic> getPublicProfileQueryParams = {};

  GetProductDetailsModel? getProductDetailsModel;
  GetProfilePublicData? getProfilePublicData;

  Data? data;
  List<Map<String, String>> deliveryChargeList = [];

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    otherUserId = parameters[ApiKeyConstants.otherUserId] ?? '';
    productId = parameters[ApiKeyConstants.productId] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int getRandomView() {
    Random random = Random();
    int randomNumber = random.nextInt(20);
    return randomNumber;
  }

  void increment() => count.value++;

  clickOnBackIcon() {
    Get.back();
  }

  bool productReservedOrNot(String available) {
    switch (available) {
      case "sold":
        return true;
      case "reserved":
        return true;
      case "paid":
        return true;
      case "process":
        return false;
      default:
        return false;
    }
  }

  clickOnPickPoint() {
    Map<String, String> data = {
      'lat': userLat.value,
      'lon': userLon.value,
    };
    Get.toNamed(Routes.DELIVERY_NEARBY_POINTS, parameters: data);
  }

  clickOnMyAddress() async {
    await Get.toNamed(Routes.EDIT_ADDRESS);
    getMyAddress();
    getShippingChargeList();
  }

  clickOnChat() {
    Map<String, String> detailForChat = {
      'userName': getProfilePublicData!.userName ?? '',
      'userImage': getProfilePublicData!.image ?? '',
      'userAmount': getProductDetailsModel!.data!.price ?? '',
      'otherUserId': otherUserId,
      'userId': userId,
      'request_id': getProductDetailsModel!.data!.id ?? '',
      'product_status':
          getProductDetailsModel!.data!.userId == userId ? 'Yes' : 'No',
    };
    Get.toNamed(Routes.CHAT_DETAIL, parameters: detailForChat);
  }

  checkUserType() async {
    bool youAreUser = LocalData.userType;
    if (youAreUser) {
      clickOnBuyButton();
    } else {
      bool result = await CheckScreenPermission.checkPermission('4', '21');
      if (result) {
        clickOnBuyButton();
      } else {
        CommonWidgets.showMyToastMessage(
            StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
      }
    }
  }

  clickOnBuyButton() {
    if (userId == otherUserId) {
      CommonWidgets.showMyToastMessage(
          'You can not buy products because this product is your own ...');
    } else {
      if (productReservedOrNot(data!.availableAt ?? '')) {
        CommonWidgets.showMyToastMessage(
            'You can not buy products because this product is reserved or already sold please contact to seller ...');
      } else {
        if (presentUserAddress.value) {
          Map<String, String> data = {
            'my_address': myAddress.value,
            'lat': userLat.value,
            'lon': userLon.value,
            'country': userCountry.value,
            'country_code': userCountryCode.value,
            'zip_code': userZipCode.value,
            'userName': getProfilePublicData!.userName ?? '',
            'userImage': getProfilePublicData!.image ?? '',
          };
          Get.toNamed(Routes.DELIVERY,
              arguments: getProductDetailsModel, parameters: data);
        } else {
          CommonWidgets.showMyToastMessage('Please select your address first');
          clickOnMyAddress();
        }
      }
    }
  }

  clickOnReportProduct() {
    Map<String, String> data = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.productId: getProductDetailsModel!.data!.id ?? '',
      ApiKeyConstants.sellerId: getProductDetailsModel!.data!.userId ?? '',
      ApiKeyConstants.fullName: getProductDetailsModel!.data!.title ?? '',
    };
    Get.toNamed(Routes.SHIPMENT_REQUEST, parameters: data);
  }

  clickOnLearnMoreButton() {
    Get.toNamed(Routes.ROT_PROTECTION);
  }

  clickOnUserProfileTile() {
    Map<String, String> data = {ApiKeyConstants.otherUserId: otherUserId};
    Get.toNamed(Routes.PROFILE_PUBLIC, parameters: data);
  }

  Future<void> onInitWork() async {
    await getProductDetailApi();
    await getProfilePublicApi();
    await getMyAddress();
    await getShippingChargeList();
  }

  Future<void> getProductDetailApi() async {
    queryParameters = {
      ApiKeyConstants.productId: productId,
      ApiKeyConstants.userId: userId,
    };
    getProductDetailsModel =
        await ApiMethods.getProductDetail(queryParameters: queryParameters);
    if (getProductDetailsModel != null &&
        getProductDetailsModel!.data != null) {
      data = getProductDetailsModel!.data!;
      try {
        lat.value = double.parse(data!.productLat ?? '22.7196');
        lon.value = double.parse(data!.productLon ?? '75.8577');
      } catch (e) {
        lat.value = 22.7196;
        lon.value = 75.8577;
        print('Error :- lat long error');
      }
    }
  }

  Future<void> getProfilePublicApi() async {
    getPublicProfileQueryParams = {
      ApiKeyConstants.userId: otherUserId,
    };
    print("get public profile param:- $getPublicProfileQueryParams");
    GetProfilePublicModel? getProfilePublicModel =
        await ApiMethods.getProfilePublic(
            queryParameters: getPublicProfileQueryParams);
    if (getProfilePublicModel != null && getProfilePublicModel.data != null) {
      getProfilePublicData = getProfilePublicModel.data!;
    }
  }

  clickOnLikeButton() async {
    await productLikeUnlikeApi();
  }

  Future<void> productLikeUnlikeApi() async {
    queryParameters = {
      ApiKeyConstants.productId: productId,
      ApiKeyConstants.userId: userId,
    };
    http.Response? response =
        await ApiMethods.productLikeUnlike(queryParameters: queryParameters);
    if (response != null) {
      await onInitWork();
      increment();
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
    } else {
      presentUserAddress.value = false;
    }
    increment();
  }

  Future<void> getShippingChargeList() async {
    try {
      Map<String, dynamic> getShippingChargeParameters = {
        ApiKeyConstants.countryCode: userCountryCode.value,
        ApiKeyConstants.zipCode: userZipCode.value,
        ApiKeyConstants.kg: data!.weightDim == 'gr'
            ? '${(double.parse(data!.weight != '' ? data!.weight ?? '2000' : '2000')) / 1000}'
            : data!.weight ?? '2',
      };
      print("bodyParam:-$getShippingChargeParameters");
      getShippingChargeModel = await ApiMethods.getShippingChargeApi(
          queryParameters: getShippingChargeParameters);
      if (getShippingChargeModel != null &&
          getShippingChargeModel!.status == '1') {
        presentShipment.value = true;
        companyName.value = getShippingChargeModel!.data![0].companyName ?? '';
        setCharge(getShippingChargeModel!);
      } else {
        presentShipment.value = false;
        CommonWidgets.showMyToastMessage("${getShippingChargeModel!.message}");
      }
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
        deliveryChargeList.add({
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

  clickOnDeliveryTime() {
    showModalBottomSheet(
      context: Get.context!,
      constraints: BoxConstraints(maxHeight: 600.px, minHeight: 300.px),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.px,
            ),
            Text(
              StringConstants.deliveryExpectedIn,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.px,
                  ),
            ),
            Text(
              'Courier Company: ${companyName.value}',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12.px,
                  ),
            ),
            ListView.builder(
              itemCount: deliveryChargeList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10.px),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      deliveryCharge.value =
                          deliveryChargeList[index]['title'] ?? '0';
                      deliveryTime.value =
                          deliveryChargeList[index]['subtitle'] ?? '';
                      Get.back();
                      increment();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.px),
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.px),
                    ),
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icLocation),
                    title: Text(
                      '${deliveryChargeList[index]['type']} ${deliveryChargeList[index]['title']} € ',
                      style: MTextThemeStyle.titleMedium(
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      '${deliveryChargeList[index]['subtitle']}',
                      style: MTextThemeStyle.titleMedium(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> clickOnShareButton() async {
    /* increment();
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        final directory = await getTemporaryDirectory();
        final imagePath =
            await File('${directory.path}/screenshot.png').create();

        // Save the screenshot as a file
        await imagePath.writeAsBytes(image);

        // Share the file
        await Share.shareFiles([imagePath.path],
            text: 'Here is my screenshot!');
      }
    }).catchError((onError) {
      print('Error:-${onError}');
    });*/
    await Share.share(' Name:${getProductDetailsModel?.data?.title}\n'
        ' Price:${getProductDetailsModel?.data?.price}\n'
        ' Image:${getProductDetailsModel?.data?.productImage?[0].image}\n'
        ' Install App:.......App still not live');
  }
}
