import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_collaborator_permission_model.dart';
import '../../../data/apis/api_models/get_simple_model.dart';

class InviteCollaboratorChooseARoleSendInvitationController
    extends GetxController {
  TextEditingController emailController = TextEditingController();
  final count = 0.obs;
  final permissionCount = 0.obs;

  final isChecked = false.obs;
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  List<CollaboratorPermissionData> selectedPermissionList = Get.arguments;
  String userId = '';
  String permissionIds = '';

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId)!;
    super.onInit();
    emailController.text = parameters[ApiKeyConstants.email] ?? '';
    permissionCount.value = selectedPermissionList.length;
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

  clickOnSendInvitationButton() {
    sendInvitationRequest();
  }

  clickOnCancelButton() {}

  clickOnChangeEmail() {}

  clickOnChangeRole() {
    Get.back();
  }

  Future<void> sendInvitationRequest() async {
    try {
      await convertPermissionId();
      Map<String, dynamic> sendInviteParameters = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.email: parameters[ApiKeyConstants.email],
        ApiKeyConstants.role: parameters[ApiKeyConstants.role],
        ApiKeyConstants.permission: permissionIds
      };
      print("bodyParam:-$sendInviteParameters");
      inAsyncCall.value = true;
      SimpleResponseModel? simpleResponseModel =
          await ApiMethods.sendInviteCollaborationApi(
              bodyParams: sendInviteParameters);
      if (simpleResponseModel != null && simpleResponseModel.status == 1) {
        inAsyncCall.value = false;
        CommonWidgets.showMyToastMessage(simpleResponseModel.messages ?? '');

        Get.until((route) => Get.currentRoute == Routes.GENERAL_SETTING);
      } else {
        inAsyncCall.value = false;
        CommonWidgets.showMyToastMessage(simpleResponseModel!.messages ?? '');
      }
    } catch (e) {
      inAsyncCall.value = false;
      print('Error:- ${e.toString()}');
      CommonWidgets.showMyToastMessage('Failed to update request ...');
    }
    permissionIds = '';
  }

  Future<void> convertPermissionId() async {
    for (int i = 0; i < selectedPermissionList.length; i++) {
      //permissionIds.add(int.parse(selectedPermissionList[i].id ?? '1'));
      if (i == 0) {
        permissionIds = '$permissionIds${selectedPermissionList[i].id}';
      } else {
        permissionIds = '$permissionIds,${selectedPermissionList[i].id}';
      }
    }
  }
}
