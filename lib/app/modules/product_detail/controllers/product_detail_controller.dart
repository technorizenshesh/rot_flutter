import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class ProductDetailController extends GetxController {
  final count = 0.obs;

  final cardIndex = 0.obs;
  String productId = '';
  String userId = '';
  Map<String, String?> parameters = Get.parameters;
  final inAsyncCall = false.obs;
  Map<String, dynamic> queryParameters = {};

  GetProductDetailsModel? getProductDetailsModel;

  Data? data;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
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

  void increment() => count.value++;

  clickOnBackIcon() {
    Get.back();
  }

  clickOnChat() {}

  clickOnBuyButton() {
    Get.toNamed(Routes.DELIVERY);
  }

  clickOnReportProduct() {}

  clickOnLearnMoreButton() {}

  clickOnUserProfileTile() {
    Get.toNamed(Routes.PROFILE_PUBLIC);
  }

  Future<void> onInitWork() async {
    await getProductDetailApi();
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
