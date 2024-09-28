import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_wish_category_model.dart';

import '../../../../common/check_permission.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class WishController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  List<WishCategoryData> data = [];
  Map<String, String?> parameters = Get.parameters;
  WishCategoryModel? getWishCategoryModel;

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

  checkUserType({required int index}) async {
    bool youAreUser = LocalData.userType;
    if (youAreUser) {
      clickOnCard(index: index);
    } else {
      bool result = await CheckScreenPermission.checkPermission('2', '19');
      if (result) {
        clickOnCard(index: index);
      } else {
        CommonWidgets.showMyToastMessage(
            StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
      }
    }
  }

  clickOnCard({required int index}) {
    if (index == 0 || index == 1 || index == 2) {
      Map<String, String> passParameters = {
        ApiKeyConstants.wishName: data[index].name ?? '',
        ApiKeyConstants.wishId: data[index].id ?? '',
        ApiKeyConstants.type: 'Post'
      };
      Get.toNamed(Routes.CATEGORIES, parameters: passParameters);
    } else {
      switch (index) {
        case 3:
          Map<String, String> passParameters = {
            ApiKeyConstants.wishName: data[index].name ?? '',
            ApiKeyConstants.wishId: data[index].id ?? '',
            ApiKeyConstants.type: 'Post',
            StringConstants.title: 'Coins',
            ApiKeyConstants.categoryId: '23',
            ApiKeyConstants.categoryName: 'collecting',
            ApiKeyConstants.subCategoryId: '150'
          };
          Get.toNamed(Routes.UPLOAD_COIN_BACKNOTES, parameters: passParameters);
          break;
        case 4:
          Map<String, String> passParameters = {
            ApiKeyConstants.wishName: data[index].name ?? '',
            ApiKeyConstants.wishId: data[index].id ?? '',
            ApiKeyConstants.type: 'Post',
            StringConstants.title: 'Banknotes',
            ApiKeyConstants.categoryId: '23',
            ApiKeyConstants.categoryName: 'collecting',
            ApiKeyConstants.subCategoryId: '143'
          };
          Get.toNamed(Routes.UPLOAD_COIN_BACKNOTES, parameters: passParameters);
          break;
        case 5:
          Map<String, String> passParameters = {
            ApiKeyConstants.wishName: data[index].name ?? '',
            ApiKeyConstants.wishId: data[index].id ?? '',
            ApiKeyConstants.type: 'Post',
            StringConstants.title: data[index].name ?? '',
            ApiKeyConstants.categoryId: '3',
            ApiKeyConstants.categoryName: data[index].name ?? '',
          };
          Get.toNamed(Routes.SUB_CATEGORY, parameters: passParameters);
          break;
        case 6:
          Map<String, String> passParameters = {
            ApiKeyConstants.wishName: data[index].name ?? '',
            ApiKeyConstants.wishId: data[index].id ?? '',
            ApiKeyConstants.type: 'Post',
            StringConstants.title: 'Services',
            ApiKeyConstants.categoryId: '30',
            ApiKeyConstants.categoryName: 'Services',
          };
          Get.toNamed(Routes.SUB_CATEGORY, parameters: passParameters);
          break;
        case 7:
          Map<String, String> passParameters = {
            ApiKeyConstants.wishName: data[index].name ?? '',
            ApiKeyConstants.wishId: data[index].id ?? '',
            ApiKeyConstants.type: 'Post',
            StringConstants.title: 'HouseHold',
            ApiKeyConstants.categoryId: '3',
            ApiKeyConstants.categoryName: 'HouseHold',
          };
          Get.toNamed(Routes.SUB_CATEGORY, parameters: passParameters);
          break;
        case 8:
          Map<String, String> passParameters = {
            ApiKeyConstants.wishName: data[index].name ?? '',
            ApiKeyConstants.wishId: data[index].id ?? '',
            ApiKeyConstants.type: 'Post',
            StringConstants.title: 'Employment',
            ApiKeyConstants.categoryId: '29',
            ApiKeyConstants.categoryName: 'Employment',
          };
          Get.toNamed(Routes.SUB_CATEGORY, parameters: passParameters);
          break;
      }
    }
  }

  Future<void> onInitWork() async {
    await getCategoryApi();
  }

  Future<void> getCategoryApi() async {
    getWishCategoryModel = await ApiMethods.getWishCategory();
    if (getWishCategoryModel != null &&
        getWishCategoryModel?.data != null &&
        getWishCategoryModel!.data!.isNotEmpty) {
      data = getWishCategoryModel!.data ?? [];
    }
  }
}
