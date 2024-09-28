import 'package:get/get.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';
import 'package:rot_application/common/check_permission.dart';
import 'package:rot_application/common/local_data.dart';
import 'package:rot_application/common/login_with_google.dart';
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
    {'title': StringConstants.wallet.tr, 'icon': ImageConstants.imageWallet},
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
    /*  {'title': StringConstants.user.tr, 'icon': IconConstants.icUserProfile},*/
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

  clickOnListTile({required int index}) async {
    Map<String, String> data = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.wallet: userData!.wallet ?? '0'
    };
    bool youAreUser = LocalData.userType;
    if (youAreUser) {
      switch (index) {
        case 0:
          Get.toNamed(Routes.SALES, parameters: data);
          break;
        case 1:
          Get.toNamed(Routes.PURCHASES, parameters: data);
          break;
        case 2:
          Get.toNamed(Routes.WALLET, parameters: data);
          break;
        case 3:
          Get.toNamed(Routes.SUBSCRIPTION, parameters: data);
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
          Get.toNamed(Routes.MY_QR_CODE, parameters: data);
          break;
        case 8:
          CommonWidgets.showAlertDialog(
            onPressedYes: () => clickOnYes(),
          );
          break;
      }
    } else {
      switch (index) {
        case 0:
          bool result = await CheckScreenPermission.checkPermission('2', '19');
          print('result:-$result');
          if (result) {
            Get.toNamed(Routes.SALES, parameters: data);
          } else {
            CommonWidgets.showMyToastMessage(
                StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
          }

          break;
        case 1:
          bool result = await CheckScreenPermission.checkPermission('4', '21');
          print('result:-$result');
          if (result) {
            Get.toNamed(Routes.PURCHASES, parameters: data);
          } else {
            CommonWidgets.showMyToastMessage(
                StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
          }
          break;
        case 2:
          bool result = await CheckScreenPermission.checkPermission('14', '31');
          print('result:-$result');
          if (result) {
            Get.toNamed(Routes.WALLET, parameters: data);
          } else {
            CommonWidgets.showMyToastMessage(
                StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
          }
          break;
        case 3:
          bool result = await CheckScreenPermission.checkPermission('7', '24');
          print('result:-$result');
          if (result) {
            Get.toNamed(Routes.SUBSCRIPTION, parameters: data);
          } else {
            CommonWidgets.showMyToastMessage(
                StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
          }
          break;
        case 4:
          bool result = await CheckScreenPermission.checkPermission('8', '25');
          print('result:-$result');
          if (result) {
            Get.toNamed(Routes.GENERAL_SETTING, parameters: data);
          } else {
            CommonWidgets.showMyToastMessage(
                StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
          }
          break;
        case 5:
          bool result = await CheckScreenPermission.checkPermission('9', '26');
          print('result:-$result');
          if (result) {
            Get.toNamed(Routes.CHANGE_PASSWORD, parameters: data);
          } else {
            CommonWidgets.showMyToastMessage(
                StringConstants.thisScreenIsNotAllowedByTheSeller.tr);
          }
          break;
        case 6:
          Get.toNamed(Routes.HELP);
          break;
        case 7:
          Get.toNamed(Routes.MY_QR_CODE, parameters: data);
          break;
        case 8:
          CommonWidgets.showAlertDialog(
            onPressedYes: () => clickOnYes(),
          );
          break;
      }
    }
  }

  clickOnYes() async {
    MyGoogleAuthentication.signOut(context: Get.context!);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ApiKeyConstants.token, '');
    sharedPreferences.clear();
    selectedIndex.value = 0;
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
