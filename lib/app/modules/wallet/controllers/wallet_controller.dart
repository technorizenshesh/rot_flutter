import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';

import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class WalletController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  List listOfListTile = [
    {
      'title': StringConstants.historyOfMovements,
      'icon': IconConstants.icHistoryOfMovements
    },
    {
      'title': StringConstants.bankInformation,
      'icon': IconConstants.icBankInformation
    },
    {'title': StringConstants.converter, 'icon': IconConstants.icConverter},
    {
      'title': StringConstants.addNewAccount,
      'icon': IconConstants.icAddNewAccount
    },
  ];

  @override
  void onInit() {
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

  clickOnListTile({required int index}) {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!
    };
    switch (index) {
      case 0:
        Get.toNamed(Routes.HISTORY_OF_MOVEMENTS);
      case 1:
        Get.toNamed(Routes.BANK_INFORMATION, parameters: data);
      case 2:
        Get.toNamed(Routes.CONVERTER);
      // case 3:
      //   Get.toNamed(Routes.ADD_NEW_ACCOUNT);
      case 3:
        Get.toNamed(Routes.ADD_NEW_CARD, parameters: data);
    }
  }

  clickOnSendMoney() {}

  clickOnPay() {}

  clickOnWithDraw() {
    Get.toNamed(Routes.WITHDRAW);
  }

  clickOnCharge() {}

  clickOnRecharge() {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!
    };
    Get.toNamed(Routes.RECHARGE, parameters: data);
  }

  clickOnAccounts() {
    Get.toNamed(Routes.ACCOUNTS);
  }
}
