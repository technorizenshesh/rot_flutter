import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_all_product_model.dart';

class SearchViewController extends GetxController {
  final count = 0.obs;
  GetAllProductModel? getAllProductModel;

  List<AllProductData> allProductData = [];
  List<AllProductData> searchResult = [];
  final inAsyncCall = false.obs;
  TextEditingController searchController = TextEditingController();

  @override
  Future<void> onInit() async {
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
      if (res.productName!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }
}
