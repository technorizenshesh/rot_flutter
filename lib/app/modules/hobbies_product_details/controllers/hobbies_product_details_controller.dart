import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/get_profile_public_model.dart';
import '../../../routes/app_pages.dart';

class HobbiesProductDetailsController extends GetxController {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final count = 0.obs;
  final lat = 22.7196.obs;
  final lon = 75.8577.obs;
  final deliveryCharge = '3.49'.obs;
  final deliveryTime = 'Delivery in 3-7 business days'.obs;
  final cardIndex = 0.obs;
  String productId = '';
  String userId = '';
  String otherUserId = '';
  Map<String, String?> parameters = Get.parameters;
  final inAsyncCall = false.obs;
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

  clickOnChat() {
    Map<String, String> detailForChat = {
      'userName': getProfilePublicData!.userName ?? '',
      'userImage': getProfilePublicData!.image ?? '',
      'userAmount': getProductDetailsModel!.data!.price ?? '',
      'otherUserId': otherUserId,
      'userId': userId
    };
    Get.toNamed(Routes.CHAT_DETAIL, parameters: detailForChat);
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
}
