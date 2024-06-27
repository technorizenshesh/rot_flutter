import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_all_product_model.dart';
import '../../../routes/app_pages.dart';

class ProductsAccordingCategoryController extends GetxController {
  final count = 0.obs;
  final cardIndex = 0.obs;
  final inAsyncCall = true.obs;

  String userId = '';

  GetAllProductModel? getAllProductModel;

  List<AllProductData> allProductData = [];
  Map<String, String?> parameters = Get.parameters;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
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
    Map<String, String> parametersPass = {
      ApiKeyConstants.productId: allProductData[index].id ?? '',
      ApiKeyConstants.otherUserId: allProductData[index].userId ?? ''
    };
    //Get.toNamed(Routes.PRODUCT_DETAIL, parameters: parametersPass);
    openProductUploadPage(
        parametersPass, allProductData[index].categoryId ?? '');
  }

  Future<void> onInitWork() async {
    await getCategoryProductsApi();
  }

  Future<void> getCategoryProductsApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.categoryId: parameters[ApiKeyConstants.categoryId] ?? '',
    };
    getAllProductModel = await ApiMethods.getCategoryProductList(
        queryParameters: queryParameters);
    if (getAllProductModel != null &&
        getAllProductModel!.data != null &&
        getAllProductModel!.data!.isNotEmpty) {
      allProductData = getAllProductModel!.data ?? [];
    }
    increment();
  }

  openProductUploadPage(Map<String, String> data, String categoryId) {
    print('Category id:-$categoryId');
    switch (categoryId) {
      case '1':

        /// For Car....
        Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        break;
      case '2':
        {
          /// For Motorcycle....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '3':
        {
          /// For Real and estate....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '7':
        {
          /// For Computer....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '8':
        {
          /// For Phone....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '9':
        {
          /// For Baby....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '10':
        {
          /// For Game....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '11':
        {
          /// For Fation....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '14':
        {
          /// For Agriculture and pets....
          Get.toNamed(Routes.HOBBIES_PRODUCT_DETAILS, parameters: data);
        }
        break;
      case '16':
        {
          /// For Training And Books....
          Get.toNamed(Routes.HOBBIES_PRODUCT_DETAILS, parameters: data);
        }
        break;
      case '17':
        {
          /// For Image and Sound....
          Get.toNamed(Routes.HOBBIES_PRODUCT_DETAILS, parameters: data);
        }
        break;
      case '18':
        {
          /// For Sport and nautical....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
      case '19':
        {
          /// For Electronic....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
      case '21':
        {
          /// For Engine and accessories....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
      case '22':
        {
          /// For Home and garden....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
      case '20':
        {
          /// For Hobbies and Ieisure....
          Get.toNamed(Routes.HOBBIES_PRODUCT_DETAILS, parameters: data);
        }
        break;
      case '23':
        {
          /// For Collecting....
          Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        }
        break;
      case '29':
        {
          /// For Employment....
          Get.toNamed(Routes.HOBBIES_PRODUCT_DETAILS, parameters: data);
        }
        break;
      case '30':
        {
          /// For Services....
          Get.toNamed(Routes.HOBBIES_PRODUCT_DETAILS, parameters: data);
        }
        break;

      default:
        // Get.toNamed(Routes.SUB_CATEGORY_PRODUCTS, arguments: data);
        Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        break;
    }
  }
}
