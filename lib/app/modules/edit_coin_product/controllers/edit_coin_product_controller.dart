import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_currency_model.dart';
import '../../../data/apis/api_models/get_material_model.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../data/apis/api_models/get_state_model.dart';
import '../../../routes/app_pages.dart';

class EditCoinProductController extends GetxController {
  GetProductDetailsModel getProductDetailsModel = Get.arguments;
  final cardIndex = 0.obs;
  final count = 0.obs;
  final enableShipping = false.obs;
  final publicPhoneValue = false.obs;
  final completeRegistration = true.obs;
  final getUserAddressPresent = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController denominationController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController eraController = TextEditingController();
  TextEditingController issureController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController compositionController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  TextEditingController telPhoneCodeController = TextEditingController();
  TextEditingController whatsAppCodeController = TextEditingController();
  TextEditingController productConditionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController diameterController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController reference1Controller = TextEditingController();
  TextEditingController reference2Controller = TextEditingController();

  final inAsyncCall = false.obs;
  final transmissionId = ''.obs;
  final currencyId = ''.obs;
  final currencyName = ''.obs;
  final currencySymbol = '\$'.obs;
  final engineTypeId = ''.obs;
  final material = ''.obs;
  String productStatusId = '';
  String userId = '';
  final categoryId = ''.obs;
  final lat = ''.obs;
  final lon = ''.obs;
  final defaultLocation = ''.obs;
  final country = ''.obs;
  final zipcode = ''.obs;
  final city = ''.obs;
  final countryCode = 'IN'.obs;
  final diameterDim = 'cm'.obs;
  final lengthDim = 'cm'.obs;
  final widthDim = 'cm'.obs;
  final heightDim = 'cm'.obs;
  final weightDim = 'gr'.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, String?> parameters = Get.parameters;
  GetStateModel? getStateModel;
  //List<String> materialList = ['nickel', 'copper', 'gold', 'silver'];

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];
  List<String> volumeDimensionList = ['cm', 'inch', 'foot'];
  List<String> weightDimensionList = ['gr', 'kg', 'ton'];
  List<MaterialData> materialList = [];
  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    categoryId.value = '${getProductDetailsModel.data!.categoryId}';
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

  onChangeDimensions(int index, String value) {
    switch (index) {
      case 0:
        lengthDim.value = value;
        break;
      case 1:
        widthDim.value = value;
        break;
      case 2:
        heightDim.value = value;
        break;
      case 3:
        weightDim.value = value;
        break;
      case 4:
        diameterDim.value = value;
        break;
    }
  }

  clickOnPostAddButton() async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        productConditionController.text.isNotEmpty &&
        country.value.isNotEmpty &&
        zipcode.value.isNotEmpty &&
        priceController.text.isNotEmpty) {
      if (completeRegistration.value) {
        inAsyncCall.value = true;
        await postAddApi();
        inAsyncCall.value = false;
      } else {
        CommonWidgets.showMyToastMessage(
            'Please complete your profile first..');
        await Get.toNamed(Routes.PROFILE_DETAIL);
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
    await getCurrencyApi();
    await setProductData();
  }

  setProductData() {
    titleController.text = getProductDetailsModel.data!.title.toString();
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
    zipcode.value = getProductDetailsModel.data!.zipCode.toString();
    country.value = getProductDetailsModel.data!.country.toString();
    countryCode.value = getProductDetailsModel.data!.countryCode.toString();
    lat.value = getProductDetailsModel.data!.productLat.toString();
    lon.value = getProductDetailsModel.data!.productLon.toString();
    priceController.text = getProductDetailsModel.data!.price.toString();
    categoryController.text = getProductDetailsModel.data!.modelName.toString();
    countryController.text = getProductDetailsModel.data!.country.toString();
    denominationController.text =
        getProductDetailsModel.data!.typeEngine.toString();
    yearController.text =
        getProductDetailsModel.data!.registrationYear.toString();
    eraController.text = getProductDetailsModel.data!.motor.toString();
    issureController.text = getProductDetailsModel.data!.motor.toString();
    diameterDim.value = getProductDetailsModel.data!.kilometer.toString();
    reference1Controller.text =
        getProductDetailsModel.data!.transmission.toString();
    reference2Controller.text =
        getProductDetailsModel.data!.transmission.toString();
    material.value = getProductDetailsModel.data!.color.toString();
    numberController.text = getProductDetailsModel.data!.partNumber.toString();
    weightController.text = getProductDetailsModel.data!.weight.toString();
    diameterController.text = getProductDetailsModel.data!.kilometer.toString();
    diameterDim.value = getProductDetailsModel.data!.kilometer.toString();
    weightDim.value = getProductDetailsModel.data!.weightDim.toString();

    onChangedCurrencyField(
        value: getProductDetailsModel.data!.currenyId.toString());
    material.value = getProductDetailsModel.data!.color.toString();

    increment();
    // onChangedBrandField(value: getProductDetailsModel.data!.color.toString());
  }

  Future<void> getCurrencyApi() async {
    getCurrencyModel = await ApiMethods.getCurrency();
    if (getCurrencyModel != null &&
        getCurrencyModel?.data != null &&
        getCurrencyModel!.data!.isNotEmpty) {
      currencyData = getCurrencyModel!.data ?? [];
    }
  }

  Future<void> getMaterialApi() async {
    MaterialModel? materialModel = await ApiMethods.getMaterialList();
    if (materialModel != null &&
        materialModel?.data != null &&
        materialModel!.data!.isNotEmpty) {
      materialList = materialModel.data ?? [];
    }
    increment();
  }

  onChangedMaterialField({String? value}) {
    material.value = value ?? '';
    increment();
  }

  onChangedBrandField({String? value}) {
    materialList.forEach((element) async {
      if (element.materialName.toString() == value) {
        material.value = element.materialName ?? '';
        increment();
      }
    });
  }

  onChangedCurrencyField({String? value, bool nameType = false}) {
    currencyData.forEach((element) async {
      if (nameType) {
        if (element.currencyName.toString() == value) {
          currencyId.value = element.id ?? '';
          currencyName.value = element.currencyName ?? '';
          currencySymbol.value = element.currencySymbols ?? '';
          increment();
        }
      } else {
        if (element.id.toString() == value) {
          currencyId.value = element.id ?? '';
          currencyName.value = element.currencyName ?? '';
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
        ApiKeyConstants.productLocation:
            productLocationController.text.toString(),
        ApiKeyConstants.productLat: lat.value.toString(),
        ApiKeyConstants.productLon: lon.value.toString(),
        ApiKeyConstants.country: country.value,
        ApiKeyConstants.zipCode: zipcode.value,
        ApiKeyConstants.brandId: '',
        ApiKeyConstants.productStatusId: productConditionController.text,
        ApiKeyConstants.hashtagId: '',
        ApiKeyConstants.price: priceController.text.toString(),
        ApiKeyConstants.currencyId: currencyId.value.toString(),
        ApiKeyConstants.countryCode: countryCode.value.toString(),
        ApiKeyConstants.weight: weightController.text ?? '',
        ApiKeyConstants.weightDim: weightDim.value.toString(),
        ApiKeyConstants.productVolume:
            '${lengthController.text} ${lengthDim.value} x ${widthController.text} ${widthDim.value}'
                'x ${heightController.text} ${heightDim.value}',
        ApiKeyConstants.wishId: getProductDetailsModel.data!.wishId ?? '',
        ApiKeyConstants.modelName: categoryController.text,
        ApiKeyConstants.typeEngine: denominationController.text,
        ApiKeyConstants.registrationYear: yearController.text.toString(),
        ApiKeyConstants.motor: '${eraController.text},${issureController.text}',
        ApiKeyConstants.kilometer: diameterDim.value,
        ApiKeyConstants.transmission:
            '${reference1Controller.text},${reference2Controller.text}',
        ApiKeyConstants.color: material.value,
        ApiKeyConstants.publicPhone: publicPhoneValue.value ? 'Yes' : 'No',
        ApiKeyConstants.shipping: enableShipping.value ? 'Yes' : 'No',
        ApiKeyConstants.partNumber: numberController.text
      };
      print("addProductBodyParams:-$postAddParameters");
      http.Response? response =
          await ApiMethods.editProductApi(queryParameters: postAddParameters);
      print("response:-${response!.body.toString()}");
      if (response != null) {
        CommonWidgets.showMyToastMessage(
            'Product Update successfully completed ...');
        Get.back();
      } else {
        CommonWidgets.showMyToastMessage('Product Update failed ...');
      }
    } catch (e) {
      print("Error:-${e.toString()}");
    }
  }
}
