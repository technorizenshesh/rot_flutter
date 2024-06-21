import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_delivery_model.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_profile_public_products_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class SalesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  String userId = '';

  late TabController tabController;
  final tabs = [
    Tab(text: StringConstants.inWind.tr),
    Tab(text: StringConstants.inProgress.tr),
    Tab(text: StringConstants.finished.tr),
  ];
  Map<String, dynamic> getPublishedProductQueryParams = {};
  List<ProfilePublicProductsData> inWindProductList = [];
  List<GetProductDeliveryData> pendingProductList = [];
  List<GetProductDeliveryData> completeProductList = [];
  final showProgressBar = true.obs;

  String getIcons(String available) {
    switch (available) {
      case "Yes":
        return IconConstants.icTruck;
      case "No":
        return IconConstants.icPersonMoney;
      default:
        return IconConstants.icTruck;
    }
  }

  String productIconStatus(String available) {
    switch (available) {
      case "sold":
        return IconConstants.icPaid;
      case "reserved":
        return IconConstants.icReserve;
      case "paid":
        return IconConstants.icPaid;
      case "process":
        return IconConstants.icMoneyReceived;
      default:
        return IconConstants.icMoneyReceived;
    }
  }

  @override
  void onInit() async {
    tabController = TabController(length: 3, vsync: this);
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    await getPublishedProductApi();
    showProgressBar.value = false;
    increment();
    getPendingProductApi();
    getCompleteProductApi();
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

  clickOnCard({required String productId}) {
    Map<String, String> data = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.productId: productId
    };
    Get.toNamed(Routes.MY_ADD_PRODUCT_DETAIL, parameters: data);
  }

  Future<void> getPublishedProductApi() async {
    getPublishedProductQueryParams = {
      ApiKeyConstants.userId: userId,
    };
    print("get published product param:- $getPublishedProductQueryParams");
    ProfilePublicProductsModel? profilePublicProductsModel =
        await ApiMethods.getProductByUserId(
            queryParameters: getPublishedProductQueryParams);
    if (profilePublicProductsModel != null &&
        profilePublicProductsModel.data != null &&
        profilePublicProductsModel.data!.isNotEmpty) {
      inWindProductList = profilePublicProductsModel.data!;
    }
  }

  Future<void> getPendingProductApi() async {
    Map<String, dynamic> getQueryParameters = {
      ApiKeyConstants.productUserId: userId,
      ApiKeyConstants.status: 'Pending'
    };
    GetProductDeliveryModel? getProductDeliveryModel =
        await ApiMethods.getProductUser(queryParameters: getQueryParameters);

    if (getProductDeliveryModel != null &&
        getProductDeliveryModel.data!.isNotEmpty) {
      pendingProductList = getProductDeliveryModel.data!;
    } else {
      print("Failed.....");
    }
  }

  Future<void> getCompleteProductApi() async {
    Map<String, dynamic> getQueryParameters = {
      ApiKeyConstants.productUserId: userId,
      ApiKeyConstants.status: 'Complete'
    };
    GetProductDeliveryModel? getProductDeliveryModel =
        await ApiMethods.getProductUser(queryParameters: getQueryParameters);

    if (getProductDeliveryModel != null &&
        getProductDeliveryModel.data!.isNotEmpty) {
      completeProductList = getProductDeliveryModel.data!;
    } else {
      print("Failed.....");
    }
  }
}
