import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/routes/app_pages.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_category_model.dart';
import '../../../data/constants/string_constants.dart';

class CategoriesController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  List<Data> data = [];
  Map<String, String> parameters = {};
  GetCategoryModel? getCategoryModel;

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

  clickOnCard({required int index}) {
    parameters = {
      StringConstants.title: data[index].categoryName ?? '',
      ApiKeyConstants.categoryId: data[index].id ?? ''
    };
    Get.toNamed(Routes.SUB_CATEGORY, parameters: parameters);
  }

  Future<void> onInitWork() async {
    await getCategoryApi();
  }

  Future<void> getCategoryApi() async {
    getCategoryModel = await ApiMethods.getCategory();
    if (getCategoryModel != null &&
        getCategoryModel?.data != null &&
        getCategoryModel!.data!.isNotEmpty) {
      data = getCategoryModel!.data ?? [];
    }
  }
}
