import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_details_model.dart';
import 'package:rot_application/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class PublicUserProductDetailsController extends GetxController {
  final count = 0.obs;

  final cardIndex = 0.obs;
  String productId = '';
  String userId = '';
  String userName = '';
  String userImage = '';
  String otherUserId = '';
  Map<String, String?> parameters = Get.parameters;
  final inAsyncCall = false.obs;
  Map<String, dynamic> queryParameters = {};

  GetProductDetailsModel? getProductDetailsModel;

  Data? data;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    otherUserId = parameters[ApiKeyConstants.otherUserId] ?? '';
    productId = parameters[ApiKeyConstants.productId] ?? '';
    userImage = parameters['userImage'] ?? '';
    userName = parameters['userName'] ?? '';
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

  clickOnChat() {
    Map<String, String> detailForChat = {
      'userName': userName,
      'userImage': userImage,
      'userAmount': getProductDetailsModel!.data!.price ?? '',
      'otherUserId': otherUserId,
      'userId': userId
    };
    Get.toNamed(Routes.CHAT_DETAIL, parameters: detailForChat);
  }

  clickOnBuyButton() {
    if (userId == otherUserId) {
      CommonWidgets.showMyToastMessage(
          'You can not buy products because this product is your own ...');
    } else {
      Get.toNamed(Routes.DELIVERY, arguments: getProductDetailsModel);
    }
  }

  clickOnReportProduct() {}

  clickOnLearnMoreButton() {}

  clickOnUserProfileTile() {
    Map<String, String> data = {ApiKeyConstants.otherUserId: otherUserId};
    Get.toNamed(Routes.PROFILE_PUBLIC, parameters: data);
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
