import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_all_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_methods.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_banner_model.dart';
import '../../../data/apis/api_models/get_category_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final cardIndex = 0.obs;

  List list = [
    {'title': 'Fashion', 'icon': IconConstants.icFashion},
    {'title': 'Electronics', 'icon': IconConstants.icComputerAndElectronic},
    {'title': 'Sports', 'icon': IconConstants.icSports},
    {'title': 'Furniture', 'icon': IconConstants.icFurniture},
  ];

  List listOfCards = [
    {
      'title': 'electric kettle',
      'price': '${CommonMethods.cur}29.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image1.png',
    },
    {
      'title': 'boAt Rockerz 551 ANC...',
      'price': '${CommonMethods.cur}20.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image2.png',
    },
    {
      'title': 'Badminton',
      'price': '${CommonMethods.cur}05.00',
      'subTitle': 'Rua dos Ingleses, 355 - Bela Vista 01327-000',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image3.png',
    },
    {
      'title': 'Canon D7500 DSLR Camera Body',
      'price': '${CommonMethods.cur}449.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image4.png',
    },
  ];

  List listOfCards2 = [
    {
      'title': 'electric kettle',
      'price': '${CommonMethods.cur}29.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image5.png',
    },
    {
      'title': 'boAt Rockerz 551 ANC...',
      'price': '${CommonMethods.cur}20.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image6.png',
    },
    {
      'title': 'Badminton',
      'price': '${CommonMethods.cur}05.00',
      'subTitle': 'Rua dos Ingleses, 355 - Bela Vista 01327-000',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image3.png',
    },
  ];

  List listOfCards3 = [
    {
      'title': 'electric kettle',
      'price': '${CommonMethods.cur}29.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icMoneyReceived,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image7.png',
    },
    {
      'title': 'boAt Rockerz 551 ANC...',
      'price': '${CommonMethods.cur}20.00',
      'subTitle': 'Via del corso Rome 305, 98168 Villaggio..',
      'icon1': IconConstants.icSaving,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image8.png',
    },
    {
      'title': 'Badminton',
      'price': '${CommonMethods.cur}05.00',
      'subTitle': 'Rua dos Ingleses, 355 - Bela Vista 01327-000',
      'icon1': IconConstants.icHands,
      'icon2': IconConstants.icTruck,
      'image': 'assets/un_used_images/image5.png',
    },
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
    Get.toNamed(Routes.PRODUCT_DETAIL);
  }

  seeAll() {
    Get.toNamed(Routes.CATEGORIES);
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
      ApiKeyConstants.categoryId: data[index].id ?? ''
    };
    Get.toNamed(Routes.SUB_CATEGORY, parameters: parameters);
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
}
