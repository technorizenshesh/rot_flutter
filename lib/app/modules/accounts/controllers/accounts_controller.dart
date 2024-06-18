import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_account_model.dart';
import 'package:rot_application/app/data/apis/api_models/response_model.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:rot_application/common/common_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class AccountsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController localPhone = TextEditingController();
  TextEditingController localEmail = TextEditingController();
  TextEditingController localRecipient = TextEditingController();
  TextEditingController localWhere = TextEditingController();
  TextEditingController localPassword = TextEditingController();
  TextEditingController localBankName = TextEditingController();
  TextEditingController swiftRecipient = TextEditingController();
  TextEditingController swiftWhere = TextEditingController();
  TextEditingController swiftSwiftCode = TextEditingController();
  TextEditingController swiftBankName = TextEditingController();
  TextEditingController swiftPhone = TextEditingController();
  TextEditingController swiftEmail = TextEditingController();

  final count = 0.obs;
  final currencyName = 'USD'.obs;
  final inAsyncCall = false.obs;
  late TabController tabController;
  final tabs = [
    Tab(text: StringConstants.local.tr),
    Tab(text: StringConstants.swift.tr),
  ];

  List listOfData = [
    {'title': StringConstants.recipient.tr, 'subtitle': ''},
    {'title': StringConstants.were.tr, 'subtitle': ''},
    {'title': StringConstants.bicSwiftCode.tr, 'subtitle': ''},
    {'title': StringConstants.bankNameAndAddress.tr, 'subtitle': ''},
  ];

  List listOfDataLocal = [
    {'title': StringConstants.useThisData.tr, 'icon': IconConstants.icIdea},
    {
      'title': StringConstants.provideThisData.tr,
      'icon': IconConstants.icEarth
    },
    {
      'title': StringConstants.ifTheIssuingBank.tr,
      'icon': IconConstants.icTime
    },
    {'title': StringConstants.ifYourEmployer.tr, 'icon': IconConstants.icFlag},
  ];

  final countryDailCode = '+91'.obs;
  final countryCode = 'IN'.obs;
  String userId = '';

  GetAccountModel? localAccount;
  GetAccountModel? internationalAccount;

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    getLocalAccount();
    getInternationAccount();
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

  clickOnCountryCode({required CountryCode value}) {
    countryDailCode.value = value.toString();
    countryCode.value = value.code.toString();
  }

  setInitialValue() {
    localRecipient.text = '';
    localWhere.text = '';
    localPassword.text = '';
    localBankName.text = '';
    swiftRecipient.text = '';
    swiftWhere.text = '';
    swiftSwiftCode.text = '';
    swiftBankName.text = '';
  }

  clickOnShareButton(int index) {
    if (index == 0) {
      String copyText =
          '${StringConstants.recipient}: ${localRecipient.text}\n ${StringConstants.were}: ${localRecipient.text}\n ${StringConstants.dniCiPassword}: '
          '${localPassword.text}\n ${StringConstants.bankNameAndAddress}: ${localBankName.text} \n '
          '${StringConstants.phoneNumber}: ${localPhone.text} \n ${StringConstants.email}: ${localEmail.text}';
      shareAllDetails(copyText);
    } else {
      String copyText =
          '${StringConstants.recipient}: ${swiftRecipient.text}\n ${StringConstants.were}: ${swiftWhere.text}\n ${StringConstants.bicSwiftCode}: '
          '${swiftSwiftCode.text}\n ${StringConstants.bankNameAndAddress}: ${swiftBankName.text} \n '
          '${StringConstants.phoneNumber}: ${swiftPhone.text} \n ${StringConstants.email}: ${swiftEmail.text}';
      shareAllDetails(copyText);
    }
  }

  shareAllDetails(String text) {
    Share.share(text, subject: 'Account Details');
  }

  clickOnCopyIcon(int index) {
    String copyText = '';
    switch (index) {
      case 0:
        {
          copyText = localRecipient.text.toString();
        }
        break;
      case 1:
        {
          copyText = localWhere.text.toString();
        }
        break;
      case 2:
        {
          copyText = localPassword.text.toString();
        }
        break;
      case 3:
        {
          copyText = localBankName.text.toString();
        }
        break;
      case 4:
        {
          copyText = localPhone.text.toString();
        }
        break;
      case 5:
        {
          copyText = localEmail.text.toString();
        }
        break;
      case 6:
        {
          copyText = swiftRecipient.text.toString();
        }
        break;
      case 7:
        {
          copyText = swiftWhere.text.toString();
        }
        break;
      case 8:
        {
          copyText = swiftSwiftCode.text.toString();
        }
        break;
      case 9:
        {
          copyText = swiftBankName.text.toString();
        }
        break;
      case 10:
        {
          copyText = swiftPhone.text.toString();
        }
        break;
      case 11:
        {
          copyText = swiftEmail.text.toString();
        }
        break;
    }
    Clipboard.setData(ClipboardData(text: copyText));
    CommonWidgets.showMyToastMessage("Copied to Clipboard");
  }

  clickOnEditButton() {
    if (tabController.index == 0) {
      if (localAccount != null &&
          localRecipient.text.trim().isNotEmpty &&
          localWhere.text.trim().isNotEmpty &&
          localPassword.text.trim().isNotEmpty &&
          localBankName.text.trim().isNotEmpty &&
          localPhone.text.trim().isNotEmpty &&
          localEmail.text.trim().isNotEmpty) {
        Map<String, String> bodyParams = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.id: localAccount!.data!.id ?? '',
          ApiKeyConstants.recipient: localRecipient.text.toString(),
          ApiKeyConstants.were: localWhere.text.toString(),
          ApiKeyConstants.swiptCode: localPassword.text.toString(),
          ApiKeyConstants.bankName: localBankName.text.toString(),
          ApiKeyConstants.phone: localPhone.text.toString(),
          ApiKeyConstants.countryCode: countryCode.value,
          ApiKeyConstants.email: localEmail.text.toString(),
          ApiKeyConstants.type: 'local',
        };
        Get.toNamed(Routes.ACCOUNT_VERIFICATION_TYPE,
            parameters: bodyParams, arguments: localAccount);
      } else {
        CommonWidgets.showMyToastMessage('Please first create account.');
      }
    } else {
      if (internationalAccount != null &&
          swiftRecipient.text.trim().isNotEmpty &&
          swiftWhere.text.trim().isNotEmpty &&
          swiftSwiftCode.text.trim().isNotEmpty &&
          swiftBankName.text.trim().isNotEmpty &&
          swiftPhone.text.trim().isNotEmpty &&
          swiftEmail.text.trim().isNotEmpty) {
        Map<String, String> bodyParams = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.id: internationalAccount!.data!.id ?? '',
          ApiKeyConstants.recipient: swiftRecipient.text.toString(),
          ApiKeyConstants.were: swiftWhere.text.toString(),
          ApiKeyConstants.swiptCode: swiftSwiftCode.text.toString(),
          ApiKeyConstants.bankName: swiftBankName.text.toString(),
          ApiKeyConstants.phone: swiftPhone.text.toString(),
          ApiKeyConstants.countryCode: countryCode.value,
          ApiKeyConstants.email: swiftEmail.text.toString(),
          ApiKeyConstants.type: 'international',
        };

        Get.toNamed(Routes.ACCOUNT_VERIFICATION_TYPE,
            parameters: bodyParams, arguments: internationalAccount);
      } else {
        CommonWidgets.showMyToastMessage('Please first create account.');
      }
    }
  }

  clickOnSaveButton() {
    if (tabController.index == 0) {
      createLocalAccount();
    } else {
      createSwiftAccount();
    }
  }

  createLocalAccount() async {
    if (localRecipient.text.trim().isNotEmpty &&
        localWhere.text.trim().isNotEmpty &&
        localPassword.text.trim().isNotEmpty &&
        localBankName.text.trim().isNotEmpty &&
        localPhone.text.trim().isNotEmpty &&
        localEmail.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      increment();
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.recipient: localRecipient.text.toString(),
        ApiKeyConstants.were: localWhere.text.toString(),
        ApiKeyConstants.swiptCode: localPassword.text.toString(),
        ApiKeyConstants.bankName: localBankName.text.toString(),
        ApiKeyConstants.phone: localPhone.text.toString(),
        ApiKeyConstants.countryCode: countryCode.value,
        ApiKeyConstants.email: localEmail.text.toString(),
        ApiKeyConstants.type: 'local',
      };

      print("parameters:-${bodyParams}");
      ResponseModel? responseModel =
          await ApiMethods.createLocalInternationalAccount(
        queryParameters: bodyParams,
      );
      if (responseModel != null && responseModel.status == 1) {
        CommonWidgets.showMyToastMessage('Successfully create  local account.');
        inAsyncCall.value = false;
        getLocalAccount();
      }
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  createSwiftAccount() async {
    if (swiftRecipient.text.trim().isNotEmpty &&
        swiftWhere.text.trim().isNotEmpty &&
        swiftSwiftCode.text.trim().isNotEmpty &&
        swiftBankName.text.trim().isNotEmpty &&
        swiftPhone.text.trim().isNotEmpty &&
        swiftEmail.text.trim().isNotEmpty) {
      inAsyncCall.value = true;
      increment();
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.recipient: swiftRecipient.text.toString(),
        ApiKeyConstants.were: swiftWhere.text.toString(),
        ApiKeyConstants.swiptCode: swiftSwiftCode.text.toString(),
        ApiKeyConstants.bankName: swiftBankName.text.toString(),
        ApiKeyConstants.phone: swiftPhone.text.toString(),
        ApiKeyConstants.countryCode: countryCode.value,
        ApiKeyConstants.email: swiftEmail.text.toString(),
        ApiKeyConstants.type: 'international',
      };
      ResponseModel? responseModel =
          await ApiMethods.createLocalInternationalAccount(
              queryParameters: bodyParams);
      if (responseModel != null && responseModel.status == 1) {
        CommonWidgets.showMyToastMessage(
            'Successfully create  international account.');
      }
      inAsyncCall.value = false;
      getInternationAccount();
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }

  getLocalAccount() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.type: 'local',
    };
    GetAccountModel? getAccountModel =
        await ApiMethods.getAccountApi(queryParameters: bodyParams);
    if (getAccountModel != null &&
        getAccountModel.status == '1' &&
        getAccountModel.data != null) {
      localAccount = getAccountModel;
      localRecipient.text = getAccountModel.data!.recipient ?? '';
      localWhere.text = getAccountModel.data!.were ?? '';
      localPassword.text = getAccountModel.data!.swiptCode ?? '';
      localBankName.text = getAccountModel.data!.bankName ?? '';
      localPhone.text = getAccountModel.data!.phone ?? '';
      localEmail.text = getAccountModel.data!.email ?? '';
      CommonWidgets.showMyToastMessage(
          'Successfully create  international account.');
    }
    increment();
  }

  getInternationAccount() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.type: 'international',
    };
    GetAccountModel? getAccountModel =
        await ApiMethods.getAccountApi(queryParameters: bodyParams);
    if (getAccountModel != null &&
        getAccountModel.status == '1' &&
        getAccountModel.data != null) {
      internationalAccount = getAccountModel;
      swiftRecipient.text = getAccountModel.data!.recipient ?? '';
      swiftWhere.text = getAccountModel.data!.were ?? '';
      swiftSwiftCode.text = getAccountModel.data!.swiptCode ?? '';
      swiftBankName.text = getAccountModel.data!.bankName ?? '';
      swiftPhone.text = getAccountModel.data!.phone ?? '';
      swiftEmail.text = getAccountModel.data!.email ?? '';
      CommonWidgets.showMyToastMessage(
          'Successfully create  international account.');
    }
    increment();
  }
}
