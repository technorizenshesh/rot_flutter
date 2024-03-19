import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:rot_application/app/data/apis/api_models/get_category_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_city_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_currency_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_state_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_country_model.dart';
import '../../../data/apis/api_models/get_hash_tag_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../data/apis/api_models/get_sub_category_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class UploadController extends GetxController {
  final count = 0.obs;

  final switchValue = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController productStatusController = TextEditingController();
  TextEditingController hashTagController = TextEditingController();
  TextEditingController priceController = TextEditingController();
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
  final currencyId = ''.obs;
  final countryId = ''.obs;
  final stateId = ''.obs;
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
    inAsyncCall.value = true;
    await postAddApi();
    inAsyncCall.value = false;
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
    currencyData.forEach((element) async {
      if (element.currencyName.toString() == value) {
        currencyId.value = element.id ?? '';
        increment();
      }
    });
  }

  Future getImage(int i) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("Image :-${pickedFile.path}");
      imageList[i] = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
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
        ApiKeyConstants.productLat: '',
        ApiKeyConstants.productLon: '',
        ApiKeyConstants.country: countryId.value.toString(),
        ApiKeyConstants.zipCode: zipCodeController.text.toString(),
        ApiKeyConstants.brandId: '',
        ApiKeyConstants.productStatusId: productStatusId,
        ApiKeyConstants.hashtagId: hashTagId,
        ApiKeyConstants.price: priceController.text.toString(),
        ApiKeyConstants.currencyId: currencyId.value.toString()
      };
      print("addProductBodyParams:-$postAddParameters");
      http.Response? response = await ApiMethods.addProductApi(
          bodyParams: postAddParameters, imageList: fileList);
      print("response:-${response!.body.toString()}");
      if (response != null) {
        CommonWidgets.showMyToastMessage('Add post successfully complete ...');
      } else {
        CommonWidgets.showMyToastMessage('Add Post failed ...');
      }
    } catch (e) {
      print("Error:-${e.toString()}");
    }
  }
}
