import 'package:get/get.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/login_with_google.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_linked_device_model.dart';
import '../../../data/apis/api_models/get_logout_token_model.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class LinkedDevicesController extends GetxController {
  String userId = '';
  List<LinkedDeviceData> linkedDeviceList = [];
  final count = 0.obs;
  final inAsyncCall = true.obs;
  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    getLinkedDeviceList();
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

  Future<void> getLinkedDeviceList() async {
    inAsyncCall.value = true;
    linkedDeviceList.clear();
    try {
      Map<String, dynamic> getFriendsParameters = {
        ApiKeyConstants.userId: userId,
      };
      print("bodyParam:-$getFriendsParameters");
      LinkedDeviceModel? linkedDeviceModel =
          await ApiMethods.getLinkedDeviceApi(bodyParams: getFriendsParameters);
      if (linkedDeviceModel != null && linkedDeviceModel.status == '1') {
        linkedDeviceList = linkedDeviceModel.data!;
      } else {
        CommonWidgets.showMyToastMessage('Linked Device are not presents ...');
      }
    } catch (e) {
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Linked Device are not presents ...');
    }
    inAsyncCall.value = false;
    increment();
  }

  void clickOnUnlink(int index) {
    CommonWidgets.showAlertDialog(
      title: StringConstants.unLink,
      content: StringConstants.doYouWantToUnlinkThisDevice,
      onPressedYes: () {
        Get.back();
        callingLogoutApi(index);
      },
    );
  }

  Future<void> callingLogoutApi(int index) async {
    try {
      Map<String, dynamic> getQueryParameters = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.token: linkedDeviceList[index].token ?? '',
        ApiKeyConstants.type: index == -1 ? 'All' : 'Single',
      };
      inAsyncCall.value = true;
      LogoutTokenModel? logoutTokenModel =
          await ApiMethods.logoutApi(bodyParams: getQueryParameters);
      if (logoutTokenModel != null && logoutTokenModel.status == '1') {
        print('logout successfully logged out.....');
        if (index == -1) {
          MyGoogleAuthentication.signOut(context: Get.context!);
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          await sharedPreferences.setString(ApiKeyConstants.token, '');
          sharedPreferences.clear();
          selectedIndex.value = 0;
          Get.offAllNamed(Routes.GET_START);
        } else {
          inAsyncCall.value = false;
          getLinkedDeviceList();
        }
      } else {
        CommonWidgets.showMyToastMessage(
            'Failed due to user are not active....');
      }
    } catch (e) {
      print('Error:---${e.toString()}');
      CommonWidgets.showMyToastMessage('Something went wrong....');
    }
    inAsyncCall.value = false;
  }
}
