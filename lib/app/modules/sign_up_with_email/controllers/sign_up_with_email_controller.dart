import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/deviceInfo.dart';
import '../../../../common/login_with_google.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SignUpWithEmailController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isFullName = false.obs;
  final isEmail = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, dynamic> bodyParams = {};

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

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() {
    Get.back();
  }

  clickOnSignUpButton() async {
    if (fullNameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.userName: fullNameController.text,
        ApiKeyConstants.email: emailController.text,
        ApiKeyConstants.password: passwordController.text,
        ApiKeyConstants.type: ApiKeyConstants.email,
      };
      UserModel? userModel =
          await ApiMethods.userSignup(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.userData != null &&
          userModel.userData!.id != null &&
          userModel.userData!.id!.isNotEmpty) {
        Map<String, String> parameters = {
          ApiKeyConstants.userId: userModel.userData!.id.toString()
        };
        Get.toNamed(Routes.OTP, parameters: parameters);
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  clickOnCancelButton() {}

  clickOnSignUpWithPhoneButton() {
    Get.back();
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
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
        ApiKeyConstants.deviceName:
            await DeviceInfo().getDeviceInfo(Get.context!),
        ApiKeyConstants.deviceId:
            await DeviceInfo().getDeviceUnique(Get.context!),
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
}
