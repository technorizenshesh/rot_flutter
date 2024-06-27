import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_place_by_zipcode_model.dart';

class SetProductLocationController extends GetxController {
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

  final isNumber = false.obs;
  final isState = false.obs;
  final isStreetName = false.obs;
  final isZipCode = false.obs;
  final isCity = false.obs;
  final isCountry = false.obs;
  final isLoading = false.obs;

  TextEditingController numberController = TextEditingController();
  TextEditingController streetNameAndNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String userId = '';

  @override
  void onInit() async {
    super.onInit();
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
  }

  void onFocusChange() {
    isNumber.value = focusNumber.hasFocus;
    isState.value = focusState.hasFocus;
    isStreetName.value = focusStreetName.hasFocus;
    isZipCode.value = focusZipCode.hasFocus;
    isCountry.value = focusCountry.hasFocus;
  }

  clickOnSaveButton() async {
    Map<String, dynamic> data = {
      ApiKeyConstants.productLocation:
          '${streetNameAndNumberController.text},${cityController.text},${zipCodeController.text},'
              '${stateController.text},${countryController.text},',
      ApiKeyConstants.productLat: lat,
      ApiKeyConstants.productLon: lon,
      ApiKeyConstants.countryCode: countryCode.value,
      ApiKeyConstants.zipCode: zipCodeController.text,
      ApiKeyConstants.country: countryController.text,
    };

    Get.back(result: data);
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
        });
  }
}
