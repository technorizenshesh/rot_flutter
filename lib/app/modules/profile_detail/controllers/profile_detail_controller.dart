import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';

class ProfileDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  final tabs = [
    const Tab(text: StringConstants.profile),
    const Tab(text: StringConstants.account),
    const Tab(text: StringConstants.reviews),
  ];

  ///PROFILE VIEW MANAGE
  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusFullName = FocusNode();
  FocusNode focusSellersAddress = FocusNode();
  final isFirstName = false.obs;
  final isLastName = false.obs;
  final isFullName = false.obs;
  final isSellersAddress = false.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController sellersAddressController = TextEditingController();

  ///ACCOUNT VIEW MANAGE
  FocusNode focusDob = FocusNode();
  FocusNode focusGender = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  final isDob = false.obs;
  final isGender = false.obs;
  final isEmail = false.obs;
  final icPhone = false.obs;
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String userId = '';

  final inAsyncCall = false.obs;
  Map<String, String> queryParameters = {};

  UserData? userData;

  Map<String, dynamic> bodyParams = {};

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 3, vsync: this);
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    startListener();
    inAsyncCall.value = true;
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

  void startListener() {
    focusFirstName.addListener(onFocusChange);
    focusLastName.addListener(onFocusChange);
    focusFullName.addListener(onFocusChange);
    focusSellersAddress.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
    focusGender.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFirstName.value = focusFirstName.hasFocus;
    isFullName.value = focusFullName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    isSellersAddress.value = focusSellersAddress.hasFocus;
    isDob.value = focusDob.hasFocus;
    isGender.value = focusGender.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    icPhone.value = focusPhone.hasFocus;
  }

  Future<void> onInitWork() async {
    await getProfileApi();
  }

  Future<void> getProfileApi() async {
    queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      userData = userModel.userData;
      if (userData != null) {
        fullNameController.text = userData!.userName ?? '';
        sellersAddressController.text = userData!.sellerAddress ?? '';
        dobController.text = userData!.dob ?? '';
        genderController.text = userData!.gender ?? '';
        emailController.text = userData!.email ?? '';
        phoneController.text = userData!.mobile ?? '';
      }
      increment();
    }
  }

  clickOnSubmitButton({String type = ''}) async {
    if (type.isNotEmpty) {
      if (fullNameController.text.trim().isNotEmpty &&
          sellersAddressController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        bodyParams = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.userName: fullNameController.text,
          ApiKeyConstants.sellerAddress: sellersAddressController.text,
        };
        http.Response? response = await ApiMethods.updateProfile(
            bodyParams: bodyParams,
            imageMap: {ApiKeyConstants.image: File('')});
        if (response != null) {}
        inAsyncCall.value = false;
      } else {
        CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
      }
    } else {
      if (fullNameController.text.trim().isNotEmpty &&
          sellersAddressController.text.trim().isNotEmpty) {
        inAsyncCall.value = true;
        bodyParams = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.email: emailController.text,
          ApiKeyConstants.gender: genderController.text,
          ApiKeyConstants.mobile: phoneController.text,
          ApiKeyConstants.dob: dobController.text,
          // ApiKeyConstants.whatsappNumber: fullNameController.text,
        };
        http.Response? response = await ApiMethods.updateProfile(
            bodyParams: bodyParams,
            imageMap: {ApiKeyConstants.image: File('')});
        if (response != null) {}
        inAsyncCall.value = false;
      } else {
        CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
      }
    }
  }
}
