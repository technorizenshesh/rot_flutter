import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_currency_model.dart';
import '../../../data/apis/api_models/get_product_details_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../routes/app_pages.dart';

class EditRealEstateController extends GetxController {
  GetProductDetailsModel getProductDetailsModel = Get.arguments;
  final cardIndex = 0.obs;
  final count = 0.obs;
  final publicPhoneValue = false.obs;
  final getUserAddressPresent = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController storageController = TextEditingController();
  TextEditingController terraceController = TextEditingController();
  TextEditingController productLocationController = TextEditingController();
  TextEditingController telPhoneCodeController = TextEditingController();
  TextEditingController whatsAppCodeController = TextEditingController();
  TextEditingController productConditionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final inAsyncCall = false.obs;
  List<String> bedRoomList = [
    'Master bedroom',
    'Children\'s bedroom',
    'Guest bedroom'
  ];
  List<String> bathRoomList = [
    'Full Bathroom',
    'Three-Quarter Bathroom',
    'Half Bathroom',
    'Quarter Bathroom'
  ];
  List<String> parkingList = ['Parking', 'No Parking'];
  final bedRoom = ''.obs;
  final bathRoom = ''.obs;
  final parking = ''.obs;
  final currencyId = ''.obs;
  final currencyName = ''.obs;
  final currencySymbol = '\$'.obs;
  String productStatusId = '';
  String userId = '';
  String title = '';
  final lat = ''.obs;
  final lon = ''.obs;
  final defaultLocation = ''.obs;
  final country = ''.obs;
  final zipcode = ''.obs;
  final countryCode = 'IN'.obs;
  final categoryId = ''.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, String?> parameters = Get.parameters;

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];

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
        sizeController.text.isNotEmpty &&
        storageController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        productConditionController.text.isNotEmpty &&
        country.value.isNotEmpty &&
        zipcode.value.isNotEmpty &&
        priceController.text.isNotEmpty) {
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
    productLocationController.text =
        getProductDetailsModel.data!.productLocation.toString();
    zipcode.value = getProductDetailsModel.data!.zipCode.toString();
    country.value = getProductDetailsModel.data!.country.toString();
    countryCode.value = getProductDetailsModel.data!.countryCode.toString();
    lat.value = getProductDetailsModel.data!.productLat.toString();
    lon.value = getProductDetailsModel.data!.productLon.toString();
    priceController.text = getProductDetailsModel.data!.price.toString();
    bedRoom.value = getProductDetailsModel.data!.modelName.toString();
    bathRoom.value = getProductDetailsModel.data!.typeEngine.toString();
    parking.value = getProductDetailsModel.data!.registrationYear.toString();
    sizeController.text = getProductDetailsModel.data!.motor.toString();
    storageController.text = getProductDetailsModel.data!.kilometer.toString();
    terraceController.text =
        getProductDetailsModel.data!.transmission.toString();

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

  onChangedBedRoomField({String? value}) {
    bedRoom.value = value ?? '';
    increment();
  }

  onChangedBathRoomField({String? value}) {
    bathRoom.value = value ?? '';
    increment();
  }

  onChangedPackingField({String? value}) {
    parking.value = value ?? '';
    increment();
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
        ApiKeyConstants.productStatusId:
            productConditionController.text.toString(),
        ApiKeyConstants.hashtagId: '',
        ApiKeyConstants.price: priceController.text.toString(),
        ApiKeyConstants.currencyId: currencyId.value.toString(),
        ApiKeyConstants.countryCode: countryCode.value.toString(),
        ApiKeyConstants.weight: '',
        ApiKeyConstants.weightDim: '',
        ApiKeyConstants.productVolume: '',
        ApiKeyConstants.wishId: getProductDetailsModel.data!.wishId ?? '',
        ApiKeyConstants.modelName: bedRoom.value,
        ApiKeyConstants.typeEngine: bathRoom.value,
        ApiKeyConstants.registrationYear: parking.value,
        ApiKeyConstants.motor: sizeController.text.toString(),
        ApiKeyConstants.kilometer: storageController.text.toString(),
        ApiKeyConstants.transmission: terraceController.text.toString(),
        ApiKeyConstants.color: '',
        ApiKeyConstants.publicPhone: publicPhoneValue.value ? 'Yes' : 'No',
        ApiKeyConstants.shipping: 'No',
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
