import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/user_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  List listOfListTile = [
    {'title': StringConstants.sales.tr, 'icon': IconConstants.icSales},
    {'title': StringConstants.purchases.tr, 'icon': IconConstants.icPurchases},
    {'title': StringConstants.wallet.tr, 'icon': IconConstants.icWallet},
    {
      'title': StringConstants.subscription.tr,
      'icon': IconConstants.icSubscription
    },
    {
      'title': StringConstants.generalSetting.tr,
      'icon': IconConstants.icGeneralSetting
    },
    {
      'title': StringConstants.changePassword.tr,
      'icon': IconConstants.icChangePassword
    },
    {'title': StringConstants.help.tr, 'icon': IconConstants.icHelp},
    {'title': StringConstants.myQRCode.tr, 'icon': IconConstants.icMyRrCode},
    {'title': StringConstants.user.tr, 'icon': IconConstants.icUserProfile},
    {'title': StringConstants.logOut.tr, 'icon': IconConstants.icLogOut},
  ];

  String userId = '';

  final inAsyncCall = false.obs;
  Map<String, String> queryParameters = {};

  UserData? userData;

  @override
  Future<void> onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
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
    Map<String, String> data = {ApiKeyConstants.userId: userId};
    switch (index) {
      case 0:
        Get.toNamed(Routes.SALES);
        break;
      case 1:
        Get.toNamed(Routes.PURCHASES, parameters: data);
        break;
      case 2:
        Get.toNamed(Routes.WALLET);
        break;
      case 3:
        Get.toNamed(Routes.SUBSCRIPTION);
        break;
      case 4:
        Get.toNamed(Routes.GENERAL_SETTING);
        break;
      case 5:
        Get.toNamed(Routes.CHANGE_PASSWORD, parameters: data);
        break;
      case 6:
        Get.toNamed(Routes.HELP);
        break;
      case 7:
        Get.toNamed(Routes.MY_QR_CODE);
        break;
      case 9:
        CommonWidgets.showAlertDialog(
          onPressedYes: () => clickOnYes(),
        );
        break;
    }
  }

  clickOnYes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ApiKeyConstants.token, '');
    sharedPreferences.clear();
    selectedIndex.value = 0;
    Get.delete<NavBarController>();
    Get.offAllNamed(Routes.GET_START);
  }

  clickOnDetailCard() {
    Get.toNamed(Routes.PROFILE_DETAIL);
  }

  Future<void> onInitWork() async {
    await getProfileApi();
  }

  Future<void> getProfileApi() async {
    queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      userData = userModel.userData;
      increment();
    }
  }
}
