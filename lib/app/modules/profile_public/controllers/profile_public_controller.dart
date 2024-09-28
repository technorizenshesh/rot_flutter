import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_review_model.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_profile_public_model.dart';
import '../../../data/apis/api_models/get_profile_public_products_model.dart';
import '../../../data/constants/string_constants.dart';

class ProfilePublicController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  final lat = 22.7196.obs;
  final lon = 75.8577.obs;
  final count = 0.obs;

  late TabController tabController;
  final tabs = [
    const Tab(text: "28 ${StringConstants.published}"),
    const Tab(text: "164 ${StringConstants.reviews}"),
    const Tab(text: "+ ${StringConstants.info}"),
  ];
  Map<String, String?> parameters = Get.parameters;
  GetProfilePublicData? getProfilePublicData;
  List<ProfilePublicProductsData> products = [];
  List<ReviewData> reviewList = [];
  final inAsyncCall = false.obs;
  final likeUnlike = false.obs;
  String myId = '';
  String otherUserId = '';
  Map<String, dynamic> getPublicProfileQueryParams = {};
  Map<String, dynamic> getPublishedProductQueryParams = {};
  Map<String, dynamic> userLikeUnlikeQueryParams = {};

  @override
  void onInit() async {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
    inAsyncCall.value = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    myId = sp.getString(ApiKeyConstants.userId) ?? '';
    otherUserId = parameters[ApiKeyConstants.otherUserId] ?? '';
    await getProfilePublicApi();
    await getPublishedProductApi();
    inAsyncCall.value = false;
    getReviewApi();
    getMyAddress();
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

  changeLikeUnlike() {
    likeUnlike.value = !likeUnlike.value;
  }

  openRateUs() {
    Map<String, String> data = {
      ApiKeyConstants.userId: myId,
      ApiKeyConstants.otherUserId: otherUserId
    };
    Get.toNamed(Routes.RATE_US, parameters: data);
  }

  clickOnCard({required int index}) {
    Map<String, String> parameters = {
      ApiKeyConstants.productId: products[index].id ?? '',
      ApiKeyConstants.otherUserId: products[index].userId ?? '',
      'userName': getProfilePublicData!.userName ?? '',
      'userImage': getProfilePublicData!.image ?? ''
    };
    Get.toNamed(Routes.PUBLIC_USER_PRODUCT_DETAILS, parameters: parameters);
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

  Future<void> getPublishedProductApi() async {
    getPublishedProductQueryParams = {
      ApiKeyConstants.userId: otherUserId,
    };
    print("get published product param:- $getPublishedProductQueryParams");
    ProfilePublicProductsModel? profilePublicProductsModel =
        await ApiMethods.getProductByUserId(
            queryParameters: getPublishedProductQueryParams);
    if (profilePublicProductsModel != null &&
        profilePublicProductsModel.data != null &&
        profilePublicProductsModel.data!.isNotEmpty) {
      products = profilePublicProductsModel.data!;
    }
  }

  Future<void> getReviewApi() async {
    try {
      Map<String, dynamic> getReviewQueryParam = {
        ApiKeyConstants.sellerId: otherUserId,
      };
      print("body param:---${getReviewQueryParam}");
      ReviewModel? reviewModel =
          await ApiMethods.getReview(queryParameters: getReviewQueryParam);
      if (reviewModel!.status == '1' && reviewModel.data!.isNotEmpty) {
        reviewList = reviewModel.data!;
        increment();
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
    }
  }

  Future<void> userLikeUnlikeApi() async {
    userLikeUnlikeQueryParams = {
      ApiKeyConstants.otherUserId: otherUserId,
      ApiKeyConstants.userId: myId,
    };
    http.Response? response = await ApiMethods.userLikeUnlike(
        queryParameters: userLikeUnlikeQueryParams);
    if (response != null) {
      changeLikeUnlike();
    }
  }

  getMyAddress() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: otherUserId,
    };
    MyAddressModel? myAddressModel =
        await ApiMethods.getAddressApi(bodyParams: bodyParams);
    if (myAddressModel != null &&
        myAddressModel.status == '1' &&
        myAddressModel.data != null) {
      try {
        lat.value = double.parse(myAddressModel.data![0].lat.toString());
        lon.value = double.parse(myAddressModel.data![0].lon.toString());
      } catch (e) {
        lat.value = 22.7196;
        lon.value = 75.8577;
        print("Lat Long Error:-${e.toString()}");
      }
      increment();
    }
  }
}
