import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_category_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_city_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_currency_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_state_model.dart';
import 'package:rot_application/common/common_pickImage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_country_model.dart';
import '../../../data/apis/api_models/get_hash_tag_model.dart';
import '../../../data/apis/api_models/get_place_by_zipcode_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../data/apis/api_models/get_sub_category_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class UploadController extends GetxController {
  final count = 0.obs;
  final lat = '22.7196'.obs;
  final lon = '75.8577'.obs;
  final switchValue = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController productStatusController = TextEditingController();
  TextEditingController hashTagController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  List list = [
    StringConstants.sell.tr,
    StringConstants.buy.tr,
    StringConstants.exchange.tr,
    StringConstants.rent.tr,
    StringConstants.hire.tr,
  ];

  final selectedValue = StringConstants.sell.tr.obs;
  final inAsyncCall = false.obs;
  final completeRegistration = true.obs;
  List<CountryData> countryData = [];
  GetCategoryModel? getCategoryModel;
  List<Data> data = [];
  List<GetSubCategoryData> getSubCategoryData = [];
  GetSubCategoryModel? getSubCategoryModel;
  final categoryId = ''.obs;
  final cityId = ''.obs;
  final currencyId = ''.obs;
  final countryId = ''.obs;
  final countryCode = 'IN'.obs;
  final stateId = ''.obs;
  final lengthDim = 'cm'.obs;
  final widthDim = 'cm'.obs;
  final heightDim = 'cm'.obs;
  final weightDim = 'gm'.obs;
  String hashTagId = '';
  String productStatusId = '';
  String userId = '';
  Map<String, dynamic> queryParameters = {};
  GetStateModel? getStateModel;
  List<GetStateData> stateData = [];
  GetCityModel? getCityModel;
  List<CityData> cityData = [];

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];
  List<File?> imageList = [null, null, null, null, null];
  List<String> volumeDimensionList = ['cm', 'inch', 'foot'];
  List<String> weightDimensionList = ['gm', 'kg', 'tonne'];

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
    getImage(index);
  }

  clickOnPostAddButton() async {
    if (imageList.isNotEmpty &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        categoryId.isNotEmpty &&
        productLocationController.text.isNotEmpty &&
        productStatusController.text.isNotEmpty &&
        zipCodeController.text.isNotEmpty &&
        hashTagController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        weightController.text.isNotEmpty) {
      if (zipCodeController.text.length >= 4) {
        if (completeRegistration.value) {
          inAsyncCall.value = true;
          await postAddApi();
          inAsyncCall.value = false;
        } else {
          CommonWidgets.showMyToastMessage(
              'Please complete your profile first..');
          await Get.toNamed(Routes.PROFILE_DETAIL);
          getProfileApi();
        }
      } else {
        CommonWidgets.showMyToastMessage('Enter correct zipcode.');
      }
    } else {
      CommonWidgets.showMyToastMessage('Enter product all details.');
    }
  }

  clickOnProductsStatus() async {
    try {
      GetProductStatusData productStatus =
          await Get.toNamed(Routes.PRODUCTS_STATUS);
      if (productStatus != null) {
        productStatusId = productStatus.id.toString();
        productStatusController.text = productStatus.title.toString();
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
    }
  }

  clickOnHashtag() async {
    String tag = '';
    List<GetHashTagData> hashTagList = await Get.toNamed(Routes.HASHTAG);
    if (hashTagList.isNotEmpty) {
      hashTagList.forEach((element) {
        tag = '$tag,${element.hashTagName}';
      });
      hashTagController.text = tag;
      hashTagId = hashTagList[0].id.toString();
      print("HashTag:-${hashTagList[0].id}");
    }
  }

  Future<void> onInitWork() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    await getCategoryApi();
    await getCountryApi();
    await getCurrencyApi();
    getProfileApi();
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
        countryCode.value = element.sortname ?? 'IN';
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

  onChangeDimensions(int index, String value) {
    switch (index) {
      case 0:
        lengthDim.value = value;
        break;
      case 1:
        weightDim.value = value;
        break;
      case 2:
        heightDim.value = value;
        break;
      case 3:
        weightDim.value = value;
        break;
    }
  }

  onChangedCurrencyField({String? value}) {
    currencyData.forEach((element) async {
      if (element.currencyName.toString() == value) {
        currencyId.value = element.id ?? '';
        increment();
      }
    });
  }

  Future getImage(int i) async {
    imageList[i] = await getImagePicker(Get.context!);
    increment();
  }

  Future<void> postAddApi() async {
    try {
      List<File> fileList = [];
      imageList.forEach((element) {
        if (element != null) {
          fileList.add(element!);
        }
      });
      Map<String, dynamic> postAddParameters = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.productName: titleController.text.toString(),
        ApiKeyConstants.description: descriptionController.text.toString(),
        ApiKeyConstants.categoryId: categoryId.value.toString(),
        ApiKeyConstants.productLocation:
            productLocationController.text.toString(),
        ApiKeyConstants.productLat: lat.value.toString(),
        ApiKeyConstants.productLon: lon.value.toString(),
        ApiKeyConstants.country: countryId.value.toString(),
        ApiKeyConstants.zipCode: zipCodeController.text.toString(),
        ApiKeyConstants.brandId: '',
        ApiKeyConstants.productStatusId: productStatusId,
        ApiKeyConstants.hashtagId: hashTagId,
        ApiKeyConstants.price: priceController.text.toString(),
        ApiKeyConstants.currencyId: currencyId.value.toString(),
        ApiKeyConstants.countryCode: countryCode.value.toString(),
        ApiKeyConstants.weight: weightController.text.toString(),
        ApiKeyConstants.weightDim: weightDim.value.toString(),
        ApiKeyConstants.productVolume:
            '${lengthController.text} ${lengthDim.value} x ${widthController.text} ${widthDim.value}'
                'x ${heightController.text} ${heightDim.value}',
      };
      print("addProductBodyParams:-$postAddParameters");
      http.Response? response = await ApiMethods.addProductApi(
          bodyParams: postAddParameters, imageList: fileList);
      print("response:-${response!.body.toString()}");
      if (response != null) {
        CommonWidgets.showMyToastMessage('Add post successfully complete ...');
        areChangeProducts.value = true;
      } else {
        CommonWidgets.showMyToastMessage('Add Post failed ...');
      }
    } catch (e) {
      print("Error:-${e.toString()}");
    }
  }

  Future<void> getPlaceFromApi() async {
    GetPlacesByZipcodeModel? getPlacesByZipcodeModel =
        await ApiMethods.getPlaceByZipCodeApi(
            countryCode: countryCode.value, zipcode: zipCodeController.text);
    if (getPlacesByZipcodeModel != null &&
        getPlacesByZipcodeModel.places != null &&
        getPlacesByZipcodeModel.places!.isNotEmpty) {
      lat.value =
          getPlacesByZipcodeModel.places![0].latitude.toString() ?? '22.7196';
      lon.value =
          getPlacesByZipcodeModel.places![0].longitude.toString() ?? '75.8577';
      print("Successfully.....");
    }
  }

  Future<void> getProfileApi() async {
    queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null && userModel.status == '1') {
      if (userModel.userData!.email!.isNotEmpty &&
          userModel.userData!.mobile!.isNotEmpty &&
          userModel.userData!.countryCode!.isNotEmpty &&
          userModel.userData!.userName!.isNotEmpty) {
        completeRegistration.value = true;
      } else {
        completeRegistration.value = false;
      }
    } else {
      completeRegistration.value = false;
    }
  }
}
