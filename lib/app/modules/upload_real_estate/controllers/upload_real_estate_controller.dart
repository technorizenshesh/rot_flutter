import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_pickImage.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_currency_model.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class UploadRealEstateController extends GetxController {
  final count = 0.obs;
  final switchValue = false.obs;
  final publicPhoneValue = false.obs;
  final completeRegistration = true.obs;
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
  final currencySymbol = '\$'.obs;
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
  Map<String, dynamic> queryParameters = {};
  Map<String, String?> parameters = Get.parameters;

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];
  List<File?> imageList = [null, null, null, null, null];

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
    if (imageList.isNotEmpty &&
        titleController.text.isNotEmpty &&
        sizeController.text.isNotEmpty &&
        storageController.text.isNotEmpty &&
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
            '${titleController.text},${sizeController.text},${storageController.text},${productConditionController.text},',
        ApiKeyConstants.description: descriptionController.text.toString(),
        ApiKeyConstants.categoryId: parameters[ApiKeyConstants.categoryId],
        ApiKeyConstants.productLocation: switchValue.value
            ? '${city.value},${country.value}'
            : productLocationController.text.toString(),
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
        ApiKeyConstants.wishId: parameters[ApiKeyConstants.wishId],
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
