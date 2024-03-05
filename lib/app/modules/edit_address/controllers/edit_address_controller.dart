import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddressController extends GetxController {
  final count = 0.obs;

  FocusNode focusFullName = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusStreetNameAndNumber = FocusNode();
  FocusNode focusFloorAndDoorNumber = FocusNode();
  FocusNode focusZipCode = FocusNode();
  FocusNode focusCity = FocusNode();
  FocusNode focusCountry = FocusNode();

  final isFullName = false.obs;
  final isPhoneNumber = false.obs;
  final isStreetNameAndNumberName = false.obs;
  final isFloorAndDoorNumber = false.obs;
  final isZipCode = false.obs;
  final isCity = false.obs;
  final isCountry = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController streetNameAndNumberController = TextEditingController();
  TextEditingController floorAndDoorNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    startListener();
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
    focusFullName.addListener(onFocusChange);
    focusPhoneNumber.addListener(onFocusChange);
    focusStreetNameAndNumber.addListener(onFocusChange);
    focusFloorAndDoorNumber.addListener(onFocusChange);
    focusZipCode.addListener(onFocusChange);
    focusCountry.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isPhoneNumber.value = focusPhoneNumber.hasFocus;
    isStreetNameAndNumberName.value = focusStreetNameAndNumber.hasFocus;
    isFloorAndDoorNumber.value = focusFloorAndDoorNumber.hasFocus;
    isZipCode.value = focusZipCode.hasFocus;
    isCountry.value = focusCountry.hasFocus;
  }

  clickOnSaveButton() {}
}
