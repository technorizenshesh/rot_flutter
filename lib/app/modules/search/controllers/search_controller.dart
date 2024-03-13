import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_all_product_model.dart';
import '../../../routes/app_pages.dart';

class SearchViewController extends GetxController {
  final count = 0.obs;
  GetAllProductModel? getAllProductModel;
  String userId = '';
  List<AllProductData> allProductData = [];
  List<AllProductData> searchResult = [];
  final inAsyncCall = false.obs;
  final likeProductId = '0'.obs;
  TextEditingController searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
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

  void increment() => count.value++;

  Future<void> onInitWork() async {
    await getAllProductApi();
  }

  Future<void> getAllProductApi() async {
    getAllProductModel = await ApiMethods.getAllProduct(queryParameters: {});
    if (getAllProductModel != null &&
        getAllProductModel!.data != null &&
        getAllProductModel!.data!.isNotEmpty) {
      allProductData = getAllProductModel!.data ?? [];
    }
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    allProductData.forEach((res) {
      if (res.title!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }

  openProductDetailPage(
      {required String productId, required String otherUserId}) {
    Map<String, String> parametersPass = {
      ApiKeyConstants.productId: productId,
      ApiKeyConstants.otherUserId: otherUserId
    };
    Get.toNamed(Routes.PRODUCT_DETAIL, parameters: parametersPass);
  }

  Future<void> productLikeUnlikeApi(String productId) async {
    Map<String, dynamic> likeQueryParameters = {
      ApiKeyConstants.productId: productId,
      ApiKeyConstants.userId: userId,
    };
    http.Response? response = await ApiMethods.productLikeUnlike(
        queryParameters: likeQueryParameters);
    print("response:-${response!.body.toString()}");
    if (response != null) {
      likeProductId.value = productId;
    }
  }
}
