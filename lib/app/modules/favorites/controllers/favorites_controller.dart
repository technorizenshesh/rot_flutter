import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_methods.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_favorite_product_model.dart';
import '../../../data/apis/api_models/get_like_users_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class FavoritesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;

  late TabController tabController;
  final tabs = [
    Tab(text: StringConstants.products.tr),
    Tab(text: StringConstants.searches.tr),
    Tab(text: StringConstants.profile.tr),
    // Tab(text: StringConstants.friend.tr),
  ];
  Map<String, dynamic> productQueryParams = {};
  Map<String, dynamic> likeUserQueryParams = {};
  Map<String, String> parametersPass = {};
  String userId = '';
  List<GetFavoriteProductData> getFavoriteProductList = [];
  List<GetLikeUsersData> getLikeUserList = [];
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

  final inAsyncCall = false.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    inAsyncCall.value = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    await getAllApi();
    inAsyncCall.value = false;
  }

  Future<void> getAllApi() async {
    await getFavoriteProductApi();
    await getLikeUsersApi();
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

  clickOnCard({required int index}) {
    parametersPass = {
      ApiKeyConstants.productId: getFavoriteProductList[index].productId ?? '',
      ApiKeyConstants.otherUserId:
          getFavoriteProductList[index].product!.userId ?? ''
    };
    Get.toNamed(Routes.PRODUCT_DETAIL, parameters: parametersPass);
  }

  clickOnUserProfileTile(String otherUserId) {
    Map<String, String> data = {ApiKeyConstants.otherUserId: otherUserId};
    Get.toNamed(Routes.PROFILE_PUBLIC, parameters: data);
  }

  Future<void> getFavoriteProductApi() async {
    productQueryParams = {
      ApiKeyConstants.userId: userId,
    };
    print("param:- $productQueryParams");
    GetFavoriteProductModel? getFavoriteProductModel =
        await ApiMethods.getFavoriteProduct(
            queryParameters: productQueryParams);
    if (getFavoriteProductModel != null &&
        getFavoriteProductModel.data != null &&
        getFavoriteProductModel.data!.isNotEmpty) {
      getFavoriteProductList = getFavoriteProductModel.data ?? [];
    }
  }

  Future<void> getLikeUsersApi() async {
    likeUserQueryParams = {
      ApiKeyConstants.userId: userId,
    };
    print(" like user param:- $likeUserQueryParams");
    GetLikeUsersModel? getLikeUsersModel = await ApiMethods.getMyLikeUserList(
        queryParameters: likeUserQueryParams);
    if (getLikeUsersModel != null &&
        getLikeUsersModel.data != null &&
        getLikeUsersModel.data!.isNotEmpty) {
      getLikeUserList = getLikeUsersModel.data ?? [];
    }
  }
}
