import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_delivery_model.dart';

import '../../../../common/common_methods.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_profile_public_products_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class SalesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;

  late TabController tabController;
  final tabs = [
    Tab(text: StringConstants.inWind.tr),
    Tab(text: StringConstants.inProgress.tr),
    Tab(text: StringConstants.finished.tr),
  ];
  Map<String, dynamic> getPublishedProductQueryParams = {};
  Map<String, String?> parameters = Get.parameters;
  List<ProfilePublicProductsData> inWindProductList = [];
  List<GetProductDeliveryData> pendingProductList = [];
  List<GetProductDeliveryData> completeProductList = [];
  final showProgressBar = true.obs;
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

  clickOnCard({required int index}) {}

  Future<void> getPublishedProductApi() async {
    getPublishedProductQueryParams = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
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
      ApiKeyConstants.productUserId: parameters[ApiKeyConstants.userId],
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
      ApiKeyConstants.productUserId: parameters[ApiKeyConstants.userId],
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
