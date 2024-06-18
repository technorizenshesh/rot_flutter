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

  List<GetSubCategoryData> data = [];
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
      ApiKeyConstants.categoryName:
          parameters[ApiKeyConstants.categoryName] ?? '',
      ApiKeyConstants.wishId: parameters[ApiKeyConstants.wishId] ?? '',
      ApiKeyConstants.wishName: parameters[ApiKeyConstants.wishName] ?? '',
    };
    //Get.toNamed(Routes.SUB_CATEGORY_PRODUCTS, parameters: parametersPass);
    openProductUploadPage(parametersPass);
  }

  openProductUploadPage(Map<String, String> data) {
    print('Category name:-${parameters[StringConstants.title]}');
    switch (parameters[ApiKeyConstants.categoryId] ?? '') {
      case '1':

        /// For Car....
        Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        break;
      case '2':
        {
          /// For Motorcycle....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
        break;
      case '3':
        {
          /// For Real and estate....
          Get.toNamed(Routes.UPLOAD_REAL_ESTATE, parameters: data);
        }
        break;
      case '7':
        {
          /// For Computer....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
        break;
      case '8':
        {
          /// For Phone....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
        break;
      case '9':
        {
          /// For Baby....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
        break;
      case '10':
        {
          /// For Game....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
        break;
      case '11':
        {
          /// For Fation....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
        break;
      case '14':
        {
          /// For Agriculture and pets....
          Get.toNamed(Routes.UPLOAD_HOBBIES_LEISURE, parameters: data);
        }
        break;
      case '16':
        {
          /// For Training And Books....
          Get.toNamed(Routes.UPLOAD_HOBBIES_LEISURE, parameters: data);
        }
        break;
      case '17':
        {
          /// For Image and Sound....
          Get.toNamed(Routes.UPLOAD_HOBBIES_LEISURE, parameters: data);
        }
        break;
      case '18':
        {
          /// For Sport and nautical....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
      case '19':
        {
          /// For Electronic....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
      case '21':
        {
          /// For Engine and accessories....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
      case '22':
        {
          /// For Home and garden....
          Get.toNamed(Routes.UPLOAD_CAR_SUB_CATEGORY, parameters: data);
        }
      case '20':
        {
          /// For Hobbies and Ieisure....
          Get.toNamed(Routes.UPLOAD_HOBBIES_LEISURE, parameters: data);
        }
        break;
      case '23':
        {
          /// For Collecting....
          Get.toNamed(Routes.UPLOAD_COIN_BACKNOTES, parameters: data);
        }
        break;
      case '29':
        {
          /// For Employment....
          Get.toNamed(Routes.UPLOAD_HOBBIES_LEISURE, parameters: data);
        }
        break;
      case '30':
        {
          /// For Services....
          Get.toNamed(Routes.UPLOAD_HOBBIES_LEISURE, parameters: data);
        }
        break;

      default:
        // Get.toNamed(Routes.SUB_CATEGORY_PRODUCTS, arguments: data);
        Get.toNamed(Routes.UPLOAD, parameters: data);
        break;
    }
  }
}
