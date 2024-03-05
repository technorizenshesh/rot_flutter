import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_sub_category_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SubCategoryController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  String title = '';
  String categoryId = '';
  final inAsyncCall = false.obs;

  Map<String, dynamic> queryParameters = {};

  List<Data> data = [];
  GetSubCategoryModel? getSubCategoryModel;

  Map<String, String> parametersPass = {};

  @override
  Future<void> onInit() async {
    title = parameters[StringConstants.title] ?? '';
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
    await getSubCategoryApi();
  }

  Future<void> getSubCategoryApi() async {
    queryParameters = {ApiKeyConstants.categoryId: categoryId};
    getSubCategoryModel =
        await ApiMethods.getSubCategory(queryParameters: queryParameters);
    if (getSubCategoryModel != null &&
        getSubCategoryModel!.data != null &&
        getSubCategoryModel!.data!.isNotEmpty) {
      data = getSubCategoryModel!.data ?? [];
    }
  }

  clickOnListTile({required int index}) {
    parametersPass = {
      StringConstants.title: data[index].subCatName ?? '',
      ApiKeyConstants.subCategoryId: data[index].id ?? '',
      ApiKeyConstants.categoryId: data[index].categoryId ?? '',
    };
    Get.toNamed(Routes.SUB_CATEGORY_PRODUCTS, parameters: parametersPass);
  }
}
