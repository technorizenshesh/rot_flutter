import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_category_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_city_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_currency_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_state_model.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_country_model.dart';
import '../../../data/apis/api_models/get_sub_category_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class UploadController extends GetxController {
  final count = 0.obs;

  final switchValue = false.obs;

  List list = [
    StringConstants.sell.tr,
    StringConstants.buy.tr,
    StringConstants.exchange.tr,
    StringConstants.rent.tr,
    StringConstants.hire.tr,
  ];

  final selectedValue = StringConstants.sell.tr.obs;
  final inAsyncCall = false.obs;
  List<CountryData> countryData = [];
  GetCategoryModel? getCategoryModel;
  List<Data> data = [];
  List<GetSubCategoryData> getSubCategoryData = [];
  GetSubCategoryModel? getSubCategoryModel;
  final categoryId = ''.obs;
  final cityId = ''.obs;
  final countryId = ''.obs;
  final stateId = ''.obs;
  Map<String, dynamic> queryParameters = {};
  GetStateModel? getStateModel;
  List<GetStateData> stateData = [];
  GetCityModel? getCityModel;
  List<CityData> cityData = [];

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];

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

  clickOnCard({required int index}) {}

  clickOnPostAddButton() {}

  clickOnProductsStatus() {
    Get.toNamed(Routes.PRODUCTS_STATUS);
  }

  clickOnHashtag() {
    Get.toNamed(Routes.HASHTAG);
  }

  Future<void> onInitWork() async {
    await getCategoryApi();
    await getCountryApi();
    await getCurrencyApi();
  }

  Future<void> getCurrencyApi() async {
    getCurrencyModel = await ApiMethods.getCurrency();
    if (getCurrencyModel != null &&
        getCurrencyModel?.data != null &&
        getCurrencyModel!.data!.isNotEmpty) {
      currencyData = getCurrencyModel!.data ?? [];
    }
  }

  Future<void> getCategoryApi() async {
    getCategoryModel = await ApiMethods.getCategory();
    if (getCategoryModel != null &&
        getCategoryModel?.data != null &&
        getCategoryModel!.data!.isNotEmpty) {
      data = getCategoryModel!.data ?? [];
    }
  }

  Future<void> getCountryApi() async {
    GetCountryModel? getCountryModel = await ApiMethods.getCountry();
    if (getCountryModel != null &&
        getCountryModel.data != null &&
        getCountryModel.data!.isNotEmpty) {
      countryData = getCountryModel.data ?? [];
    }
  }

  onChangedCountryField({String? value}) {
    countryData.forEach((element) async {
      if (element.name.toString() == value) {
        stateData.clear();
        cityData.clear();
        countryId.value = element.id ?? '';
        increment();
        await getStateApi();
      }
    });
  }

  Future<void> getStateApi() async {
    queryParameters = {ApiKeyConstants.countryId: countryId.value};
    getStateModel =
        await ApiMethods.getStates(queryParameters: queryParameters);
    if (getStateModel != null &&
        getStateModel!.data != null &&
        getStateModel!.data!.isNotEmpty) {
      stateData = getStateModel!.data ?? [];
      increment();
    }
  }

  onChangedStateField({String? value}) {
    stateData.forEach((element) async {
      if (element.name.toString() == value) {
        cityData.clear();
        stateId.value = element.id ?? '';
        increment();
        await getCityApi();
      }
    });
  }

  Future<void> getCityApi() async {
    queryParameters = {ApiKeyConstants.stateId: stateId.value};
    getCityModel = await ApiMethods.getCity(queryParameters: queryParameters);
    if (getCityModel != null &&
        getCityModel!.data != null &&
        getCityModel!.data!.isNotEmpty) {
      cityData = getCityModel!.data ?? [];
      increment();
    }
  }

  onChangedCityField({String? value}) {
    cityData.forEach((element) async {
      if (element.name.toString() == value) {
        cityId.value = element.id ?? '';
        increment();
      }
    });
  }

  onChangedCategoryField({String? value}) {
    data.forEach((element) async {
      if (element.categoryName.toString() == value) {
        getSubCategoryData.clear();
        categoryId.value = element.id ?? '';
        increment();
        await getSubCategoryApi();
      }
    });
  }

  Future<void> getSubCategoryApi() async {
    queryParameters = {ApiKeyConstants.categoryId: categoryId.value};
    getSubCategoryModel =
        await ApiMethods.getSubCategory(queryParameters: queryParameters);
    if (getSubCategoryModel != null &&
        getSubCategoryModel!.data != null &&
        getSubCategoryModel!.data!.isNotEmpty) {
      getSubCategoryData = getSubCategoryModel!.data ?? [];
      increment();
    }
  }

  onChangedCurrencyField({String? value}) {
    /*cityData.forEach((element) async {
      if (element.name.toString() == value) {
        cityId.value = element.id ?? '';
        increment();
      }
    });*/
  }
}
