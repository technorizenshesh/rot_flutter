import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_currency_model.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/get_services_type_model.dart';
import '../../../routes/app_pages.dart';

class EditHobbiesController extends GetxController {
  GetProductDetailsModel getProductDetailsModel = Get.arguments;
  final cardIndex = 0.obs;
  final count = 0.obs;
  final publicPhoneValue = false.obs;
  final completeRegistration = true.obs;
  final getUserAddressPresent = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  TextEditingController telPhoneCodeController = TextEditingController();
  TextEditingController whatsAppCodeController = TextEditingController();
  TextEditingController productConditionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final inAsyncCall = false.obs;
  final time = ''.obs;
  final service = ''.obs;
  final move = ''.obs;
  final currencyId = ''.obs;
  final currencySymbol = '\$'.obs;
  String userId = '';
  String title = '';
  final lat = ''.obs;
  final lon = ''.obs;
  final defaultLocation = ''.obs;
  final country = ''.obs;
  final zipcode = ''.obs;
  final city = ''.obs;
  final countryCode = 'IN'.obs;
  final categoryId = ''.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, String?> parameters = Get.parameters;
  List<String> timeList = ['Hours', 'Days', 'Month'];
  List<GetServicesTypeData> serviceList = [];

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];
  List<String> moveList = ['Yes', 'No'];

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

  clickOnPostAddButton() async {
    if (titleController.text.isNotEmpty &&
        time.value.isNotEmpty &&
        service.value.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
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
      }
    } else {
      CommonWidgets.showMyToastMessage('Enter product all details.');
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
    await getServicesTypeApi();
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
    productLocationController.text =
        getProductDetailsModel.data!.productLocation.toString();
    zipcode.value = getProductDetailsModel.data!.zipCode.toString();
    country.value = getProductDetailsModel.data!.country.toString();
    countryCode.value = getProductDetailsModel.data!.countryCode.toString();
    lat.value = getProductDetailsModel.data!.productLat.toString();
    lon.value = getProductDetailsModel.data!.productLon.toString();
    priceController.text = getProductDetailsModel.data!.price.toString();
    time.value = getProductDetailsModel.data!.modelName.toString();
    service.value = getProductDetailsModel.data!.typeEngine.toString();
    move.value = getProductDetailsModel.data!.registrationYear.toString();
    onChangedCurrencyField(
        value: getProductDetailsModel.data!.currenyId.toString());
  }

  Future<void> getCurrencyApi() async {
    getCurrencyModel = await ApiMethods.getCurrency();
    if (getCurrencyModel != null &&
        getCurrencyModel?.data != null &&
        getCurrencyModel!.data!.isNotEmpty) {
      currencyData = getCurrencyModel!.data ?? [];
    }
  }

  Future<void> getServicesTypeApi() async {
    GetServicesTypeModel? getServicesTypeModel =
        await ApiMethods.getServicesTypeList();
    if (getServicesTypeModel != null &&
        getServicesTypeModel.data != null &&
        getServicesTypeModel.data!.isNotEmpty) {
      serviceList = getServicesTypeModel.data ?? [];
    }
  }

  onChangedTimeField({String? value}) {
    time.value = value ?? '';
    increment();
  }

  onChangedServiceField({String? value}) {
    serviceList.forEach((element) async {
      if (element.servicesName.toString() == value) {
        service.value = element.servicesName ?? '';
        increment();
      }
    });
  }

  onChangedCanIMoveField({String? value}) {
    move.value = value ?? '';
    increment();
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
        ApiKeyConstants.productStatusId: '',
        ApiKeyConstants.hashtagId: '',
        ApiKeyConstants.price: priceController.text.toString(),
        ApiKeyConstants.currencyId: currencyId.value.toString(),
        ApiKeyConstants.countryCode: countryCode.value.toString(),
        ApiKeyConstants.weight: '',
        ApiKeyConstants.weightDim: '',
        ApiKeyConstants.productVolume: '',
        ApiKeyConstants.wishId: getProductDetailsModel.data!.wishId ?? '',
        ApiKeyConstants.modelName: time.value,
        ApiKeyConstants.typeEngine: service.value,
        ApiKeyConstants.registrationYear: move.value,
        ApiKeyConstants.motor: '',
        ApiKeyConstants.kilometer: '',
        ApiKeyConstants.transmission: '',
        ApiKeyConstants.color: '',
        ApiKeyConstants.shipping: 'No',
        ApiKeyConstants.publicPhone: publicPhoneValue.value ? 'Yes' : 'No',
        ApiKeyConstants.partNumber: ''
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
