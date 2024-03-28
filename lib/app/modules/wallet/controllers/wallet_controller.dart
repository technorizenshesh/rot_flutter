import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class WalletController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  final walletAmount = '0'.obs;
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
  ];

  @override
  void onInit() {
    super.onInit();
    getProfileApi();
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
        Get.toNamed(Routes.HISTORY_OF_MOVEMENTS, parameters: data);
      case 1:
        Get.toNamed(Routes.BANK_INFORMATION, parameters: data);
      case 2:
        Get.toNamed(Routes.CONVERTER);
    }
  }

  clickOnSendMoney() {}

  clickOnPay() {}

  clickOnWithDraw() {
    Get.toNamed(Routes.WITHDRAW);
  }

  clickOnCharge() {}

  clickOnRecharge() async {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!
    };
    await Get.toNamed(Routes.RECHARGE, parameters: data);
    getProfileApi();
  }

  clickOnAccounts() {
    Get.toNamed(Routes.ACCOUNTS);
  }

  Future<void> getProfileApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]!,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      walletAmount.value = userModel.userData!.wallet ?? '0';
    }
  }
}
