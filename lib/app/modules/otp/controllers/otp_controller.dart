import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class OtpController extends GetxController {
  final count = 0.obs;

  TextEditingController pin = TextEditingController();

  Map<String, String> bodyParams = {};

  final inAsyncCall = false.obs;
  String userId = '';
  String type = '';
  String from = '';
  Map<String, String?> parameters = Get.parameters;

  @override
  void onInit() {
    userId = parameters[ApiKeyConstants.userId] ?? '';
    type = parameters[ApiKeyConstants.type] ?? '';
    from = parameters['From'] ?? '';
    super.onInit();
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

  checkOtpType() {
    if (from == 'Firebase') {
      firebaseOtpWithVerification();
    } else {
      clickOnNextButton();
    }
  }

  clickOnNextButton() async {
    if (pin.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      bodyParams = {
        ApiKeyConstants.otp: pin.text,
        ApiKeyConstants.userId: userId,
      };
      UserModel? userModel =
          await ApiMethods.userVerification(bodyParams: bodyParams);
      if (userModel != null && userModel.userData != null) {
        if (type == StringConstants.resetPassword) {
          Map<String, String> parameters = {
            ApiKeyConstants.userId: userId,
            ApiKeyConstants.type: StringConstants.resetPassword,
          };
          Get.toNamed(Routes.CREATE_NEW_PASSWORD, parameters: parameters);
        } else if (userModel.token != null &&
            userModel.token!.isNotEmpty &&
            userModel.userData != null &&
            userModel.userData!.id != null &&
            userModel.userData!.id!.isNotEmpty) {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString(ApiKeyConstants.token, userModel.token!);
          sp.setString(ApiKeyConstants.userId, userModel.userData!.id!);
          Get.toNamed(Routes.NAV_BAR);
        }
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  Future<void> firebaseOtpWithVerification() async {
    inAsyncCall.value = true;
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: parameters[ApiKeyConstants.otp] ?? '',
        smsCode: pin.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      CommonWidgets.showMyToastMessage("Opt verification successful...");
      if (parameters['Come_From'] == 'SignUp') {
        callingSigUpProcess();
      } else {
        Map<String, String> parameter = {
          ApiKeyConstants.userId: '',
          ApiKeyConstants.type: StringConstants.resetPassword,
          ApiKeyConstants.mobile: parameters[ApiKeyConstants.mobile] ?? '+91',
          'from': 'Firebase'
        };
        Get.offNamed(Routes.CREATE_NEW_PASSWORD, parameters: parameter);
      }
    } catch (e) {
      print('Error: $e');
      inAsyncCall.value = false;
    }
  }

  callingSigUpProcess() async {
    bodyParams = {
      ApiKeyConstants.userName: parameters[ApiKeyConstants.userName] ?? '',
      ApiKeyConstants.countryCode:
          parameters[ApiKeyConstants.countryCode] ?? '',
      ApiKeyConstants.mobile: parameters[ApiKeyConstants.mobile] ?? '',
      ApiKeyConstants.password: parameters[ApiKeyConstants.password] ?? '',
      ApiKeyConstants.type: ApiKeyConstants.mobile,
    };
    UserModel? userModel = await ApiMethods.userSignup(bodyParams: bodyParams);
    if (userModel != null &&
        userModel.userData != null &&
        userModel.userData!.id != null &&
        userModel.userData!.id!.isNotEmpty) {
      CommonWidgets.snackBarView(
          title: 'Registration Successfully completed ...');
    } else {
      CommonWidgets.snackBarView(
          title: userModel!.message ?? 'Registration Failure ...');
    }
    Get.back();
    inAsyncCall.value = false;
  }
}
