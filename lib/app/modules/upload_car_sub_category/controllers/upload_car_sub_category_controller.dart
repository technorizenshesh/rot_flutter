import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_brand_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_engine_type_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_model_by_brand_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_transmission_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_pickImage.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_color_model.dart';
import '../../../data/apis/api_models/get_currency_model.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../data/apis/api_models/get_state_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class UploadCarSubCategoryController extends GetxController {
  final count = 0.obs;
  final switchValue = false.obs;
  final enableShipping = false.obs;
  final publicPhoneValue = false.obs;
  final completeRegistration = true.obs;
  final getUserAddressPresent = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController partNumberController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController motorController = TextEditingController();
  TextEditingController engineTypeController = TextEditingController();
  TextEditingController transmissionController = TextEditingController();
  TextEditingController kiloMetersController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  TextEditingController telPhoneCodeController = TextEditingController();
  TextEditingController whatsAppCodeController = TextEditingController();
  TextEditingController productConditionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  final inAsyncCall = false.obs;
  List<GetEngineTypeData> engineTypeData = [];
  List<GetTransmissionData> transmissionData = [];
  GetBrandModel? getBrandModel;
  List<GetBrandData> brandData = [];
  List<GetModelByBrandData> getBrandModelData = [];
  final brandId = ''.obs;
  final modelId = ''.obs;
  final transmissionId = ''.obs;
  final currencyId = ''.obs;
  final currencySymbol = '\$'.obs;
  final engineTypeId = ''.obs;
  final registrationYear = ''.obs;
  final color = ''.obs;
  String productStatusId = '';
  String userId = '';
  String title = '';
  final lat = ''.obs;
  final lon = ''.obs;
  final defaultLocation = ''.obs;
  final country = ''.obs;
  final zipcode = ''.obs;
  final city = ''.obs;
  final countryCode = 'IN'.obs;
  final lengthDim = 'cm'.obs;
  final widthDim = 'cm'.obs;
  final heightDim = 'cm'.obs;
  final weightDim = 'gr'.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, String?> parameters = Get.parameters;
  GetStateModel? getStateModel;
  List<String> registrationYearList = [
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024'
  ];

  GetCurrencyModel? getCurrencyModel;
  List<ColorData> colorsList = [];

  List<CurrencyData> currencyData = [];
  List<File?> imageList = [null, null, null, null, null];
  List<String> volumeDimensionList = ['cm', 'inch', 'foot'];
  List<String> weightDimensionList = ['gr', 'kg', 'ton'];

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    title = parameters[StringConstants.title] ?? '';
    titleController.text =
        '${parameters[ApiKeyConstants.wishName]},${parameters[StringConstants.title]},${parameters[ApiKeyConstants.categoryName]}';
    await onInitWork();
    inAsyncCall.value = false;
    getProfileApi();
    getMyAddress();
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

  checkLocation(bool value) async {
    if (getUserAddressPresent.value) {
      switchValue.value = value;
    } else {
      CommonWidgets.showMyToastMessage('You have not set default location.');
      await Get.toNamed(Routes.EDIT_ADDRESS);
      getMyAddress();
    }
  }

  clickOnPostAddButton() async {
    if (imageList[0] != null &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        productConditionController.text.isNotEmpty &&
        country.value.isNotEmpty &&
        zipcode.value.isNotEmpty &&
        priceController.text.isNotEmpty &&
        lat.value.isNotEmpty &&
        lon.value.isNotEmpty) {
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
      CommonWidgets.showMyToastMessage('Enter product all details.');
    }
  }

  clickOnProductsStatus() async {
    try {
      GetProductStatusData productStatus =
          await Get.toNamed(Routes.PRODUCTS_STATUS);
      if (productStatus != null) {
        productStatusId = productStatus.id.toString();
        productConditionController.text = productStatus.title.toString();
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
    }
  }

  setLocation() async {
    try {
      Map<String, dynamic> productLocation =
          await Get.toNamed(Routes.SET_PRODUCT_LOCATION);
      if (productLocation != null) {
        productLocationController.text =
            productLocation[ApiKeyConstants.productLocation];
        zipcode.value = productLocation[ApiKeyConstants.zipCode];
        city.value = productLocation[ApiKeyConstants.city];
        country.value = productLocation[ApiKeyConstants.country];
        countryCode.value = productLocation[ApiKeyConstants.countryCode];
        lat.value = productLocation[ApiKeyConstants.productLat];
        lon.value = productLocation[ApiKeyConstants.productLon];
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
    }
  }

  Future<void> onInitWork() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    await getColorApi();
    await getBrandApi();
    await getCurrencyApi();
    if (parameters[ApiKeyConstants.categoryId] == '1' ||
        parameters[ApiKeyConstants.categoryId] == '2') {
      await getEngineTypeApi();
      await getTransmissionApi();
    }
  }

  Future<void> getColorApi() async {
    ColorModel? colorModel = await ApiMethods.getColorApi();
    if (colorModel != null &&
        colorModel.data != null &&
        colorModel.data!.isNotEmpty) {
      colorsList = colorModel.data!;
    }
  }

  Future<void> getCurrencyApi() async {
    getCurrencyModel = await ApiMethods.getCurrency();
    if (getCurrencyModel != null &&
        getCurrencyModel?.data != null &&
        getCurrencyModel!.data!.isNotEmpty) {
      currencyData = getCurrencyModel!.data ?? [];
    }
  }

  Future<void> getBrandApi() async {
    getBrandModel = await ApiMethods.getBrandList();
    if (getBrandModel != null &&
        getBrandModel?.data != null &&
        getBrandModel!.data!.isNotEmpty) {
      brandData = getBrandModel!.data ?? [];
    }
  }

  Future<void> getEngineTypeApi() async {
    GetEngineTypeModel? getEngineTypeModel =
        await ApiMethods.getEngineTypeList();
    if (getEngineTypeModel != null &&
        getEngineTypeModel.data != null &&
        getEngineTypeModel.data!.isNotEmpty) {
      engineTypeData = getEngineTypeModel.data ?? [];
    }
  }

  Future<void> getTransmissionApi() async {
    GetTransmissionModel? getTransmissionModel =
        await ApiMethods.getTransmissionList();
    if (getTransmissionModel != null &&
        getTransmissionModel.data != null &&
        getTransmissionModel.data!.isNotEmpty) {
      transmissionData = getTransmissionModel.data ?? [];
    }
  }

  onChangedEngineTypeField({String? value}) {
    engineTypeData.forEach((element) async {
      if (element.name.toString() == value) {
        engineTypeId.value = element.id ?? '';
        engineTypeController.text = element.name ?? '';
        increment();
      }
    });
  }

  onChangedTransmissionField({String? value}) {
    transmissionData.forEach((element) async {
      if (element.name.toString() == value) {
        transmissionId.value = element.id ?? '';
        transmissionController.text = element.name ?? '';
        increment();
      }
    });
  }

  onChangedRegistrationYearField({String? value}) {
    registrationYear.value = value ?? '';
    increment();
  }

  onChangedColorField({String? value}) {
    color.value = value ?? '';
    increment();
  }

  onChangedBrandField({String? value}) {
    brandData.forEach((element) async {
      if (element.brandName.toString() == value) {
        getBrandModelData.clear();
        print("length:-${getBrandModelData.length}");
        brandId.value = element.id ?? '';
        brandController.text = element.brandName ?? '';
        increment();
        await getBrandModelApi();
      }
    });
  }

  onChangedBrandModeField({String? value}) {
    getBrandModelData.forEach((element) async {
      if (element.modelName.toString() == value) {
        modelId.value = element.id ?? '';
        modelController.text = element.modelName ?? '';
        increment();
      }
    });
  }

  Future<void> getBrandModelApi() async {
    queryParameters = {ApiKeyConstants.brandId: brandId.value};
    GetModelByBrandModel? getModelByBrandModel =
        await ApiMethods.getModelByBrandIdList(
            queryParameters: queryParameters);
    if (getModelByBrandModel != null &&
        getModelByBrandModel.data != null &&
        getModelByBrandModel.data!.isNotEmpty) {
      getBrandModelData = getModelByBrandModel.data ?? [];
      increment();
    }
  }

  onChangedCurrencyField({String? value}) {
    currencyData.forEach((element) async {
      if (element.currencyName.toString() == value) {
        currencyId.value = element.id ?? '';
        currencySymbol.value = element.currencySymbols ?? '';
        increment();
      }
    });
  }

  clickOnCard({required int index}) {
    getImage(index);
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
        ApiKeyConstants.productName:
            '${titleController.text},${modelController.text},${productConditionController.text}',
        ApiKeyConstants.description: descriptionController.text.toString(),
        ApiKeyConstants.categoryId: parameters[ApiKeyConstants.categoryId],
        ApiKeyConstants.productLocation: switchValue.value
            ? '${city.value},${zipcode.value},${country.value}'
            : productLocationController.text.toString(),
        ApiKeyConstants.productLat: lat.value.toString(),
        ApiKeyConstants.productLon: lon.value.toString(),
        ApiKeyConstants.country: country.value,
        ApiKeyConstants.zipCode: zipcode.value,
        ApiKeyConstants.brandId: brandId.value,
        ApiKeyConstants.productStatusId: productConditionController.text,
        ApiKeyConstants.hashtagId: '',
        ApiKeyConstants.price: priceController.text.toString(),
        ApiKeyConstants.currencyId: currencyId.value.toString(),
        ApiKeyConstants.countryCode: countryCode.value.toString(),
        ApiKeyConstants.weight: weightController.text.toString(),
        ApiKeyConstants.weightDim: weightDim.value.toString(),
        ApiKeyConstants.productVolume:
            '${lengthController.text} ${lengthDim.value} x ${widthController.text} ${widthDim.value}'
                'x ${heightController.text} ${heightDim.value}',
        ApiKeyConstants.wishId: parameters[ApiKeyConstants.wishId],
        ApiKeyConstants.modelName: modelController.text,
        ApiKeyConstants.typeEngine: engineTypeController.text,
        ApiKeyConstants.registrationYear: registrationYear.value,
        ApiKeyConstants.motor: motorController.text,
        ApiKeyConstants.kilometer: kiloMetersController.text,
        ApiKeyConstants.transmission: transmissionController.text,
        ApiKeyConstants.color: color.value,
        ApiKeyConstants.publicPhone: publicPhoneValue.value ? 'Yes' : 'No',
        ApiKeyConstants.shipping: enableShipping.value ? 'Yes' : 'No',
        ApiKeyConstants.partNumber: partNumberController.text
      };
      print("addProductBodyParams:-$postAddParameters");
      http.Response? response = await ApiMethods.addProductApi(
          bodyParams: postAddParameters, imageList: fileList);
      print("response:-${response!.body.toString()}");
      if (response != null) {
        CommonWidgets.showMyToastMessage('Add post successfully complete ...');
        areChangeProducts.value = true;
        selectedIndex.value = 0;
        Get.offNamed(
          Routes.NAV_BAR,
        );
      } else {
        CommonWidgets.showMyToastMessage('Add Post failed ...');
      }
    } catch (e) {
      print("Error:-${e.toString()}");
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

  getMyAddress() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
    };
    MyAddressModel? myAddressModel =
        await ApiMethods.getAddressApi(bodyParams: bodyParams);
    if (myAddressModel != null &&
        myAddressModel.status == '1' &&
        myAddressModel.data != null) {
      countryCode.value = myAddressModel.data![0].countryCode ?? 'IN';
      defaultLocation.value =
          '${myAddressModel.data![0].street},${myAddressModel.data![0].zipcode},${myAddressModel.data![0].state},'
          '${myAddressModel.data![0].country}';
      lat.value = myAddressModel.data![0].lat ?? '22.7196';
      lon.value = myAddressModel.data![0].lon ?? '75.8577';
      countryCode.value = myAddressModel.data![0].countryCode ?? 'IN';
      country.value = myAddressModel.data![0].country ?? '';
      zipcode.value = myAddressModel.data![0].zipcode ?? '000';
      city.value = myAddressModel.data![0].city ?? '';
      getUserAddressPresent.value = true;
    } else {
      getUserAddressPresent.value = false;
    }
  }
}
