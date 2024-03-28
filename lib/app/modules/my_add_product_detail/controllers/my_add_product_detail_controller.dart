import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_details_model.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_delete_product_model.dart';

class MyAddProductDetailController extends GetxController {
  final count = 0.obs;

  final cardIndex = 0.obs;
  String productId = '';
  String userId = '';
  Map<String, String?> parameters = Get.parameters;
  final inAsyncCall = false.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, dynamic> getPublicProfileQueryParams = {};

  GetProductDetailsModel? getProductDetailsModel;

  Data? data;

  @override
  Future<void> onInit() async {
    userId = parameters[ApiKeyConstants.userId] ?? '';
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

  clickOnSellFasterButton() {}

  clickOnReportProduct() {}

  clickOnLearnMoreButton() {}

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

  Future<void> deleteProduct() async {
    Map<String, String> deleteQueryParameters = {
      ApiKeyConstants.productId: productId
    };
    print("queryParameters $deleteQueryParameters");
    DeleteProductModel? model = await ApiMethods.deleteProductByProductId(
        queryParameters: deleteQueryParameters);
    if (model != null && model.status == '1') {
      CommonWidgets.showMyToastMessage('Product successfully deleted.');
    } else {
      CommonWidgets.showMyToastMessage('Failed.....');
    }
  }
}
