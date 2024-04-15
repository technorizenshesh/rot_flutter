import 'package:country_code_picker/src/country_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/common/common_widgets.dart';

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
}
