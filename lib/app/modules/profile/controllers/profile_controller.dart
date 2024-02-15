import 'package:get/get.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/routes/app_pages.dart';

import '../../../data/constants/icons_constant.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  List listOfListTile = [
    {'title': StringConstants.sales, 'icon': IconConstants.icSales},
    {'title': StringConstants.purchases, 'icon': IconConstants.icPurchases},
    {'title': StringConstants.wallet, 'icon': IconConstants.icWallet},
    {
      'title': StringConstants.subscription,
      'icon': IconConstants.icSubscription
    },
    {
      'title': StringConstants.generalSetting,
      'icon': IconConstants.icGeneralSetting
    },
    {
      'title': StringConstants.changePassword,
      'icon': IconConstants.icChangePassword
    },
    {'title': StringConstants.help, 'icon': IconConstants.icHelp},
    {'title': StringConstants.myQRCode, 'icon': IconConstants.icMyRrCode},
    {'title': StringConstants.user, 'icon': IconConstants.icUserProfile},
    {'title': StringConstants.logOut, 'icon': IconConstants.icLogOut},
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
        Get.toNamed(Routes.SALES);
        break;
      case 1:
        Get.toNamed(Routes.PURCHASES);
        break;
      case 3:
        Get.toNamed(Routes.SUBSCRIPTION);
        break;
      case 4:
        Get.toNamed(Routes.GENERAL_SETTING);
        break;
      case 5:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case 6:
        Get.toNamed(Routes.HELP);
        break;
      case 7:
        Get.toNamed(Routes.MY_QR_CODE);
        break;
    }
  }

  clickOnDetailCard() {
    Get.toNamed(Routes.PROFILE_DETAIL);
  }
}
