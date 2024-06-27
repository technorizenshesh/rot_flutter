import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_brand_model.dart';
import '../../../data/apis/api_models/get_currency_model.dart';
import '../../../data/apis/api_models/get_engine_type_model.dart';
import '../../../data/apis/api_models/get_model_by_brand_model.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../data/apis/api_models/get_transmission_model.dart';
import '../../../routes/app_pages.dart';

class EditCarProductController extends GetxController {
  final cardIndex = 0.obs;
  final count = 0.obs;
  final switchValue = false.obs;
  final enableShipping = false.obs;
  final publicPhoneValue = false.obs;
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
  final weightDim = 'gm'.obs;
  final categoryId = ''.obs;
  Map<String, String?> parameters = Get.parameters;
  // GetStateModel? getStateModel;
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
  List<String> colorsList = [
    'Gray',
    'Green',
    'Green',
    'Blue',
    'Orange',
    'Brodgar Silver',
    'Sepia Metallic',
    'Yellow',
    'Black Matte',
    'Gold Mercury',
    'Polymimetic Gray',
    'Cyber Yellow',
    'Sarigan Quartz',
    'La Rose Noire',
    'Black',
    'Stardust Blue',
    'Ultra Red',
    'XP Green',
    'Notte Black',
    'Verde Royale',
    'Bikini',
    'Sunbeam Orange',
    'Gotham Gray'
  ];

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];
  List<String> volumeDimensionList = ['cm', 'inch', 'foot'];
  List<String> weightDimensionList = ['gm', 'kg', 'tonne'];

  GetProductDetailsModel getProductDetailsModel = Get.arguments;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    categoryId.value = '${getProductDetailsModel.data!.categoryId}';
    await onInitWork();
    inAsyncCall.value = false;
    increment();
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
  setProductData() {
    titleController.text = getProductDetailsModel.data!.title.toString();
    partNumberController.text =
        getProductDetailsModel.data!.partNumber.toString();
    modelController.text = getProductDetailsModel.data!.modelName.toString();
    registrationYear.value =
        getProductDetailsModel.data!.registrationYear ?? '2000';
    motorController.text = getProductDetailsModel.data!.motor.toString();
    partNumberController.text =
        getProductDetailsModel.data!.partNumber.toString();
    kiloMetersController.text =
        getProductDetailsModel.data!.kilometer.toString();
    color.value = getProductDetailsModel.data!.color ?? 'Green';
    productConditionController.text =
        getProductDetailsModel.data!.productStatusId.toString();
    descriptionController.text =
        getProductDetailsModel.data!.description.toString();
    publicPhoneValue.value =
        getProductDetailsModel.data!.publicPhone == 'Yes' ? true : false;
    enableShipping.value =
        getProductDetailsModel.data!.shipping == 'Yes' ? true : false;
    productLocationController.text =
        getProductDetailsModel.data!.productLocation.toString();
    weightController.text = getProductDetailsModel.data!.weight.toString();
    weightDim.value = getProductDetailsModel.data!.weightDim.toString();
    zipcode.value = getProductDetailsModel.data!.zipCode.toString();
    country.value = getProductDetailsModel.data!.country.toString();
    countryCode.value = getProductDetailsModel.data!.countryCode.toString();
    lat.value = getProductDetailsModel.data!.productLat.toString();
    lon.value = getProductDetailsModel.data!.productLon.toString();
    priceController.text = getProductDetailsModel.data!.price.toString();
    onChangedCurrencyField(
        value: getProductDetailsModel.data!.currenyId.toString());
    onChangedBrandField(value: getProductDetailsModel.data!.brandId.toString());
    if (categoryId.value == '1' || categoryId.value == '2') {
      onChangedEngineTypeField(
          value: getProductDetailsModel.data!.typeEngine.toString());
      onChangedTransmissionField(
          value: getProductDetailsModel.data!.transmission.toString());
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

  clickOnPostAddButton() async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        productConditionController.text.isNotEmpty &&
        country.value.isNotEmpty &&
        zipcode.value.isNotEmpty &&
        priceController.text.isNotEmpty &&
        lat.value.isNotEmpty &&
        lon.value.isNotEmpty) {
      inAsyncCall.value = true;
      await postAddApi();
      inAsyncCall.value = false;
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
    await getBrandApi();
    await getCurrencyApi();
    if (parameters[ApiKeyConstants.categoryId] == '1' ||
        parameters[ApiKeyConstants.categoryId] == '2') {
      await getEngineTypeApi();
      await getTransmissionApi();
    }
    await setProductData();
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

  onChangedBrandField({String? value, bool nameType = false}) {
    brandData.forEach((element) async {
      if (nameType) {
        if (element.brandName.toString() == value) {
          getBrandModelData.clear();
          print("length:-${getBrandModelData.length}");
          brandId.value = element.id ?? '';
          brandController.text = element.brandName ?? '';
          increment();
          await getBrandModelApi();
        }
      } else {
        if (element.id.toString() == value) {
          getBrandModelData.clear();
          print("length:-${getBrandModelData.length}");
          brandId.value = element.id ?? '';
          brandController.text = element.brandName ?? '';
          increment();
          await getBrandModelApi();
        }
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
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.brandId: brandId.value
    };
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

  onChangedCurrencyField({String? value, bool nameType = false}) {
    currencyData.forEach((element) async {
      if (nameType) {
        if (element.currencyName.toString() == value) {
          currencyId.value = element.id ?? '';
          currencySymbol.value = element.currencySymbols ?? '';
          increment();
        }
      } else {
        if (element.id.toString() == value) {
          currencyId.value = element.id ?? '';
          currencySymbol.value = element.currencySymbols ?? '';
          increment();
        }
      }
    });
  }

  Future<void> postAddApi() async {
    try {
      Map<String, dynamic> postAddParameters = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.productId: getProductDetailsModel.data!.id ?? '',
        ApiKeyConstants.productName: titleController.text.toString(),
        ApiKeyConstants.description: descriptionController.text.toString(),
        ApiKeyConstants.categoryId:
            getProductDetailsModel.data!.categoryId ?? '',
        ApiKeyConstants.productLocation: switchValue.value
            ? '${city.value},${country.value}'
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
        ApiKeyConstants.wishId: getProductDetailsModel.data!.wishId ?? '',
        ApiKeyConstants.modelName: modelController.text.toString(),
        ApiKeyConstants.typeEngine: engineTypeController.text.toString(),
        ApiKeyConstants.registrationYear: registrationYear.value,
        ApiKeyConstants.motor: motorController.text.toString(),
        ApiKeyConstants.kilometer: kiloMetersController.text.toString(),
        ApiKeyConstants.transmission: transmissionController.text.toString(),
        ApiKeyConstants.color: color.value,
        ApiKeyConstants.publicPhone: publicPhoneValue.value ? 'Yes' : 'No',
        ApiKeyConstants.shipping: enableShipping.value ? 'Yes' : 'No',
        ApiKeyConstants.partNumber: partNumberController.text
      };
      print("addProductBodyParams:-$postAddParameters");
      http.Response? response =
          await ApiMethods.editProductApi(queryParameters: postAddParameters);
      print("response:-${response!.body.toString()}");
      if (response != null) {
        CommonWidgets.showMyToastMessage(
            'Product Update successfully completed ...');
        Get.back();
        // Get.offNamedUntil(
        //     Routes.SALES, (route) => route.settings.name == Routes.SALES);
      } else {
        CommonWidgets.showMyToastMessage('Product Update failed ...');
      }
    } catch (e) {
      print("Error:-${e.toString()}");
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
