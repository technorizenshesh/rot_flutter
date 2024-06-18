import 'package:country_code_picker/src/country_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/login_with_google.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final icPhone = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;

  final inAsyncCall = false.obs;
  final countryCode = 'IN'.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode focusPhone = FocusNode();
  FocusNode focusPassword = FocusNode();

  Map<String, dynamic> bodyParams = {};

  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  void startListener() {
    focusPhone.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    icPhone.value = focusPhone.hasFocus;
    isPassword.value = focusPassword.hasFocus;
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

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

  clickOnResetPassword() {
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  clickOnLoginWithEmailButton() {
    Get.toNamed(Routes.LOGIN_WITH_EMAIL);
  }

  clickOnGoogleButton() async {
    inAsyncCall.value = true;
    User? user =
        await MyGoogleAuthentication.signInWithGoogle(context: Get.context!);
    if (user != null) {
      loginWithGoogleApi(user);
      print('Successfully complete login with google.....:-');
      CommonWidgets.showMyToastMessage(
          "Successfully complete login with google.....:-");
      //Navigator.pop(context);
    } else {
      CommonWidgets.showMyToastMessage("Signup with google failed ...");
      inAsyncCall.value = false;
    }
  }

  void loginWithGoogleApi(User user) async {
    try {
      bodyParams = {
        ApiKeyConstants.email: user.email,
        ApiKeyConstants.userName: user.displayName,
        ApiKeyConstants.type: ApiKeyConstants.google,
      };
      UserModel? userModel =
          await ApiMethods.loginWithGoogle(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.token != null &&
          userModel.token!.isNotEmpty &&
          userModel.userData != null &&
          userModel.userData!.id != null &&
          userModel.userData!.id!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.token!);
        sp.setString(ApiKeyConstants.userId, userModel.userData!.id!);
        print("Open Nav Bar Activity---------->>>>>>>");
        Get.offNamed(Routes.NAV_BAR);
      } else {
        print("Failed 1------<<>>>>>>>>>>>");
        CommonWidgets.showMyToastMessage("Signup with google failed ...");
      }
    } catch (e) {
      print("Failed for catch------<<>>>>>>>>>>>");
      CommonWidgets.showMyToastMessage("Error:-${e.toString()}");
    }
    inAsyncCall.value = false;
  }

  clickOnFacebookButton() {}

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }

  clickOnLoginButton() async {
    if (phoneController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.mobile: phoneController.text,
        ApiKeyConstants.countryCode: countryCode.value,
        ApiKeyConstants.password: passwordController.text,
        ApiKeyConstants.type: ApiKeyConstants.mobile,
      };
      UserModel? userModel = await ApiMethods.login(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.token != null &&
          userModel.token!.isNotEmpty &&
          userModel.userData != null &&
          userModel.userData!.id != null &&
          userModel.userData!.id!.isNotEmpty) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.token!);
        sp.setString(ApiKeyConstants.userId, userModel.userData!.id!);
        Get.toNamed(Routes.NAV_BAR);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  clickOnCountryCode({required CountryCode value}) {
    print(
        'Country code:${value.toString()},${value.code.toString()},${value.dialCode.toString()}');
    countryCode.value = value.code.toString();
  }
}
