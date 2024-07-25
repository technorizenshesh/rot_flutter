import 'package:country_code_picker/src/country_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/deviceInfo.dart';
import '../../../../common/login_with_google.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../routes/app_pages.dart';

class SignUpController extends GetxController {
  final count = 0.obs;

  FocusNode focusFullName = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isFullName = false.obs;
  final isPhoneNumber = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Map<String, dynamic> bodyParams = {};

  final countryDailCode = '+91'.obs;
  final countryCode = 'IN'.obs;

  final inAsyncCall = false.obs;
  final btnLoading = false.obs;

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
    isPhoneNumber.value = focusPhoneNumber.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() {
    Get.back();
  }

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusPhoneNumber.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  clickOnCancelButton() {}

  clickOnSignUpWithEmailButton() async {
    await Get.toNamed(Routes.SIGN_UP_WITH_EMAIL);
    Get.back();
  }

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
  }

  clickOnCountryCode({required CountryCode value}) {
    countryDailCode.value = value.toString();
    countryCode.value = value.code.toString();
  }

  Future<void> verifyPhoneNumber() async {
    if (phoneNumberController.text.trim().isNotEmpty &&
        passwordController.text.isNotEmpty &&
        fullNameController.text.isNotEmpty) {
      print(
          'Phone Number:- ${countryDailCode.value}${phoneNumberController.text}');
      btnLoading.value = true;
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '${countryDailCode.value}${phoneNumberController.text}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            print("Auto-retrieval completed: $credential");
          },
          verificationFailed: (FirebaseAuthException authException) {
            print('Error: ${authException.message}');
            CommonWidgets.showMyToastMessage('Error: ${authException.message}');
            btnLoading.value = false;
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            Map<String, String> parameters = {
              ApiKeyConstants.userName: fullNameController.text,
              ApiKeyConstants.countryCode: countryCode.value,
              ApiKeyConstants.mobile: phoneNumberController.text,
              ApiKeyConstants.password: passwordController.text,
              ApiKeyConstants.type: ApiKeyConstants.mobile,
              ApiKeyConstants.otp: verificationId,
              'Come_From': 'SignUp',
              'From': 'Firebase'
            };
            btnLoading.value = false;
            Get.offNamed(Routes.OTP, parameters: parameters);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print("Auto-retrieval timeout: $verificationId");
          },
        );
      } catch (e) {
        print('Error:- $e');
        CommonWidgets.showMyToastMessage('Error: $e');
        btnLoading.value = false;
      }
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
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
