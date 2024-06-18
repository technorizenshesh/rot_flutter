import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_my_address_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_place_by_zipcode_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_simple_model.dart';
import 'package:rot_application/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';

class EditAddressController extends GetxController {
  final count = 0.obs;
  final lat = '22.7196'.obs;
  final lon = '75.8577'.obs;
  final countryCode = 'IN'.obs;
  FocusNode focusNumber = FocusNode();
  FocusNode focusState = FocusNode();
  FocusNode focusStreetName = FocusNode();
  FocusNode focusZipCode = FocusNode();
  FocusNode focusCity = FocusNode();
  FocusNode focusCountry = FocusNode();
  FocusNode focusFloor = FocusNode();
  FocusNode focusDoor = FocusNode();

  final isNumber = false.obs;
  final isState = false.obs;
  final isStreetName = false.obs;
  final isZipCode = false.obs;
  final isCity = false.obs;
  final isFloor = false.obs;
  final isDoor = false.obs;
  final isCountry = false.obs;
  final isLoading = false.obs;

  TextEditingController numberController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController doorController = TextEditingController();
  TextEditingController streetNameAndNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String userId = '';

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    getMyAddress();
    startListener();
    countryController.text = 'India';
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

  void startListener() {
    focusNumber.addListener(onFocusChange);
    focusState.addListener(onFocusChange);
    focusStreetName.addListener(onFocusChange);
    focusZipCode.addListener(onFocusChange);
    focusCountry.addListener(onFocusChange);
    focusFloor.addListener(onFocusChange);
    focusDoor.addListener(onFocusChange);
  }

  void onFocusChange() {
    isNumber.value = focusNumber.hasFocus;
    isState.value = focusState.hasFocus;
    isStreetName.value = focusStreetName.hasFocus;
    isZipCode.value = focusZipCode.hasFocus;
    isCountry.value = focusCountry.hasFocus;
    isFloor.value = focusFloor.hasFocus;
    isDoor.value = focusDoor.hasFocus;
  }

  clickOnSaveButton() async {
    await submitAddressFromApi();
    String address =
        '${streetNameAndNumberController.text},${cityController.text},${doorController.text},${zipCodeController.text},'
        '${stateController.text},${countryController.text},';

    Get.back(result: address);
  }

  Future<void> getPlaceFromApi() async {
    GetPlacesByZipcodeModel? getPlacesByZipcodeModel =
        await ApiMethods.getPlaceByZipCodeApi(
            countryCode: countryCode.value, zipcode: zipCodeController.text);
    if (getPlacesByZipcodeModel != null &&
        getPlacesByZipcodeModel.places != null &&
        getPlacesByZipcodeModel.places!.isNotEmpty) {
      streetNameAndNumberController.text =
          getPlacesByZipcodeModel.places![0].placeName ?? '';
      stateController.text = getPlacesByZipcodeModel.places![0].state ?? '';
      cityController.text = getPlacesByZipcodeModel.places![0].placeName ?? '';
      lat.value =
          getPlacesByZipcodeModel.places![0].latitude.toString() ?? '22.7196';
      lon.value =
          getPlacesByZipcodeModel.places![0].longitude.toString() ?? '75.8577';
    } else {
      print('Invalid zipcode...');
      //CommonWidgets.showMyToastMessage('Invalid zipcode...');
    }
  }

  void showMyCurrencyPicker() {
    showCountryPicker(
        context: Get.context!,
        countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            bottomSheetHeight: 500, // Optional. Country list modal height
            //Optional. Sets the border radius for the bottomsheet.
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            //Optional. Styles the search field.
            inputDecoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.px),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.px),
                borderSide: BorderSide(
                  width: .8.px,
                  color: Theme.of(Get.context!).primaryColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.px),
                borderSide: BorderSide(
                  width: .8.px,
                  color: Theme.of(Get.context!).primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.px),
                borderSide: BorderSide(
                  width: .8.px,
                  color: Theme.of(Get.context!).primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.px),
                borderSide: BorderSide(
                  width: .8.px,
                  color:
                      Theme.of(Get.context!).colorScheme.onSecondaryContainer,
                ),
              ),
            )),
        onSelect: (Country country) {
          print(
              'Select country: ${country.displayName}  ,${country.countryCode}');
          countryController.text = country.name;
          countryCode.value = country.countryCode;
          zipCodeController.text = '';
          stateController.text = '';
          cityController.text = '';
          streetNameAndNumberController.text = '';
          numberController.text = '';
          floorController.text = '';
          doorController.text = '';
        });
  }

  Future<void> submitAddressFromApi() async {
    if (countryController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        zipCodeController.text.isNotEmpty &&
        stateController.text.isNotEmpty &&
        streetNameAndNumberController.text.isNotEmpty) {
      Map<String, dynamic> bodyParam = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.country: countryController.text,
        ApiKeyConstants.countryCode: countryCode.value,
        'zipcode': zipCodeController.text,
        'state': stateController.text,
        'city': cityController.text,
        'street': streetNameAndNumberController.text,
        'number': numberController.text,
        'floor': floorController.text,
        'door': doorController.text,
        'lat': lat.value.toString(),
        'lon': lon.value.toString(),
      };

      isLoading.value = true;

      SimpleResponseModel? simpleResponseModel =
          await ApiMethods.addAddressApi(bodyParams: bodyParam);
      if (simpleResponseModel != null && simpleResponseModel.status == 1) {
        CommonWidgets.showMyToastMessage(simpleResponseModel.messages ?? '');
      }
    } else {
      CommonWidgets.showMyToastMessage('Please enter all fields');
    }
    isLoading.value = false;
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
      streetNameAndNumberController.text = myAddressModel.data![0].street ?? '';
      countryController.text = myAddressModel.data![0].country ?? '';
      zipCodeController.text = myAddressModel.data![0].zipcode ?? '';
      stateController.text = myAddressModel.data![0].state ?? '';
      cityController.text = myAddressModel.data![0].city ?? '';
      numberController.text = myAddressModel.data![0].number ?? '';
      floorController.text = myAddressModel.data![0].floor ?? '';
      doorController.text = myAddressModel.data![0].door ?? '';

      CommonWidgets.showMyToastMessage('Successfully get address.');
    }
    increment();
  }
}
