import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_review_model.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_methods.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_profile_public_model.dart';
import '../../../data/apis/api_models/get_profile_public_products_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class ProfilePublicController extends GetxController
    with GetSingleTickerProviderStateMixin {
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

  clickOnCard({required int index}) {}

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
}
