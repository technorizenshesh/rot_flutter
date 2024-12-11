import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rot_application/app/data/apis/api_models/get_material_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_pickImage.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_currency_model.dart';
import '../../../data/apis/api_models/get_my_address_model.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';
import '../../../data/apis/api_models/get_state_model.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class UploadCoinBacknotesController extends GetxController {
  final count = 0.obs;
  final switchValue = false.obs;
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
  final currencySymbol = '\$'.obs;
  final engineTypeId = ''.obs;
  final material = ''.obs;
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
  final diameterDim = 'cm'.obs;
  final lengthDim = 'cm'.obs;
  final widthDim = 'cm'.obs;
  final heightDim = 'cm'.obs;
  final weightDim = 'gr'.obs;
  Map<String, dynamic> queryParameters = {};
  Map<String, String?> parameters = Get.parameters;
  GetStateModel? getStateModel;
  List<MaterialData> materialList = [];

  GetCurrencyModel? getCurrencyModel;

  List<CurrencyData> currencyData = [];
  List<File?> imageList = [null, null, null, null, null];
  List<String> volumeDimensionList = ['cm', 'inch', 'foot'];
  List<String> weightDimensionList = ['gr', 'kg', 'ton'];

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    title = parameters[StringConstants.title] ?? '';
    categoryController.text = parameters[StringConstants.title] ?? '';
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
        print('Product status: ---${productConditionController.text}');
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
        city.value = productLocation[ApiKeyConstants.city];
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
    getMaterialApi();
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
            '${titleController.text},${country.value},${material.value},${yearController.text},${productConditionController.text}',
        ApiKeyConstants.description: descriptionController.text.toString(),
        ApiKeyConstants.categoryId: parameters[ApiKeyConstants.categoryId],
        ApiKeyConstants.productLocation: switchValue.value
            ? '${city.value},${zipcode.value},${country.value}'
            : productLocationController.text.toString(),
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
        ApiKeyConstants.wishId: parameters[ApiKeyConstants.wishId],
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
