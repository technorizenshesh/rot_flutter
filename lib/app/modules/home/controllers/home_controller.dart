import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_all_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_banner_model.dart';
import '../../../data/apis/api_models/get_category_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final cardIndex = 0.obs;

  List list = [
    {'title': 'Fashion', 'icon': IconConstants.icFashion},
    {'title': 'Electronics', 'icon': IconConstants.icComputerAndElectronic},
    {'title': 'Sports', 'icon': IconConstants.icSports},
    {'title': 'Furniture', 'icon': IconConstants.icFurniture},
  ];

  final inAsyncCall = false.obs;

  List<Data> data = [];
  Map<String, String> parameters = {};
  Map<String, String> queryParameters = {};
  List<BannerData> bannerData = [];
  String userId = '';

  UserData? userData;
  TextEditingController searchController = TextEditingController();

  GetAllProductModel? getAllProductModel;

  List<AllProductData> allProductData = [];
  List<AllProductData> searchResult = [];

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
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
    Map<String, String> parametersPass = {
      ApiKeyConstants.productId: allProductData[index].id ?? '',
      ApiKeyConstants.otherUserId: allProductData[index].userId ?? ''
    };
    // Get.toNamed(Routes.PRODUCT_DETAIL, parameters: parametersPass);
    openProductUploadPage(
        parametersPass, allProductData[index].categoryId ?? '');
  }

  seeAll() {
    Map<String, String> data = {ApiKeyConstants.type: 'ForSee'};
    Get.toNamed(Routes.CATEGORIES, parameters: data);
  }

  clickOnSearchTextField() {
    Get.toNamed(Routes.SEARCH);
  }

  Future<void> onInitWork() async {
    await getBannerApi();
    await getCategoryApi();
    await getProfileApi();
    await getAllProductApi();
  }

  Future<void> getProfileApi() async {
    queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      userData = userModel.userData;
      increment();
    }
  }

  Future<void> getAllProductApi() async {
    getAllProductModel =
        await ApiMethods.getAllProduct(queryParameters: queryParameters);
    if (getAllProductModel != null &&
        getAllProductModel!.data != null &&
        getAllProductModel!.data!.isNotEmpty) {
      allProductData = getAllProductModel!.data ?? [];
      areChangeProducts.value = false;
    }
  }

  Future<void> getBannerApi() async {
    GetBannerModel? getBannerModel = await ApiMethods.getBanner();
    if (getBannerModel != null &&
        getBannerModel.data != null &&
        getBannerModel.data!.isNotEmpty) {
      bannerData = getBannerModel.data ?? [];
    }
  }

  Future<void> getCategoryApi() async {
    GetCategoryModel? getCategoryModel = await ApiMethods.getCategory();
    if (getCategoryModel != null &&
        getCategoryModel.data != null &&
        getCategoryModel.data!.isNotEmpty) {
      data = getCategoryModel.data ?? [];
    }
  }

  clickOnCategoryCard({required int index}) {
    parameters = {
      StringConstants.title: data[index].categoryName ?? '',
      ApiKeyConstants.categoryId: data[index].id ?? '',
      ApiKeyConstants.categoryName: data[index].categoryName ?? '',
      ApiKeyConstants.type: 'ForSee'
    };
    Get.toNamed(Routes.PRODUCTS_ACCORDING_CATEGORY, parameters: parameters);
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
        Get.toNamed(Routes.PRODUCT_DETAIL, parameters: data);
        break;
    }
  }
}
