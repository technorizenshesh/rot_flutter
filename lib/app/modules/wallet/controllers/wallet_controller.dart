import 'package:get/get.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class WalletController extends GetxController {
  final count = 0.obs;

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
    switch (index) {
      case 0:
        Get.toNamed(Routes.HISTORY_OF_MOVEMENTS);
      case 1:
        Get.toNamed(Routes.BANK_INFORMATION);
      case 2:
        Get.toNamed(Routes.CONVERTER);
      case 3:
        Get.toNamed(Routes.ADD_NEW_ACCOUNT);
    }
  }

  clickOnSendMoney() {}

  clickOnPay() {}

  clickOnWithDraw() {
    Get.toNamed(Routes.WITHDRAW);
  }

  clickOnCharge() {}

  clickOnRecharge() {
    Get.toNamed(Routes.RECHARGE);
  }

  clickOnAccounts() {
    Get.toNamed(Routes.ACCOUNTS);
  }
}
