import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_linked_device_model.dart';

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
  }
}
