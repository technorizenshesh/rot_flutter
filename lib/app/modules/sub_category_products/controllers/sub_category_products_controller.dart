import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_product_model.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SubCategoryProductsController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  String title = '';
  String subCategoryId = '';
  String categoryId = '';
  final inAsyncCall = false.obs;

  Map<String, dynamic> queryParameters = {};

  Map<String, String> parametersPass = {};

  GetProductModel? getProductModel;
  List<Data> data = [];

  List listOfCards2 = [
    {
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
    },
    /*{
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
    },
    {
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
    },*/
  ];

  @override
  Future<void> onInit() async {
    title = parameters[StringConstants.title] ?? '';
    subCategoryId = parameters[ApiKeyConstants.subCategoryId] ?? '';
    categoryId = parameters[ApiKeyConstants.categoryId] ?? '';
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
    await getSubCategoryProductApi();
  }

  Future<void> getSubCategoryProductApi() async {
    queryParameters = {
      ApiKeyConstants.subCategoryId: subCategoryId,
      ApiKeyConstants.categoryId: categoryId
    };
    getProductModel =
        await ApiMethods.getProduct(queryParameters: queryParameters);
    if (getProductModel != null &&
        getProductModel!.data != null &&
        getProductModel!.data!.isNotEmpty) {
      data = getProductModel!.data ?? [];
    }
  }

  clickOnCard({required int index}) {
    parametersPass = {
      ApiKeyConstants.productId: data[index].id ?? '',
      ApiKeyConstants.otherUserId: data[index].userId ?? '',
    };
    Get.toNamed(Routes.PRODUCT_DETAIL, parameters: parametersPass);
  }
}
