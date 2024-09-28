import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_collaborators_invited_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_simple_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class CollaboratorController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final count = 0.obs;
  final showLoading = true.obs;
  List<CollaboratorsInvitedData> invitedUserList = [];
  List<CollaboratorsInvitedData> filterInvitedUserList = [];
  String userId = '';
  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    getCollaboratorsInvitedUserApi();
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

  searchMethod({required String value}) {
    filterInvitedUserList.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    invitedUserList.forEach((res) {
      if (res.email!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        filterInvitedUserList.add(res);
      }
    });
    increment();
  }

  clickOnInviteCollaboratorButton() {
    //Get.toNamed(Routes.COLLABORATORS_READY_TO_SEND);
    Get.toNamed(Routes.INVITE_COLLABORATOR);
  }

  clickOnManageRolesButton() {}

  Future<void> getCollaboratorsInvitedUserApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
    };
    CollaboratorsInvitedModel? collaboratorsInvitedModel =
        await ApiMethods.getCollaboratorsInvitedListApi(bodyParams: bodyParams);
    if (collaboratorsInvitedModel != null &&
        collaboratorsInvitedModel.status == "1") {
      invitedUserList = collaboratorsInvitedModel.data!;
      filterInvitedUserList = collaboratorsInvitedModel.data!;
    } else {
      CommonWidgets.showMyToastMessage(
          collaboratorsInvitedModel!.message ?? '');
    }
    showLoading.value = false;
    increment();
  }

  Future<void> resendInviteApi(String inviteId) async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.inviteId: inviteId,
    };
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.resendCollaboratorsInviteApi(bodyParams: bodyParams);
    if (simpleResponseModel != null) {
      showLoading.value = true;
      getCollaboratorsInvitedUserApi();
    } else {
      CommonWidgets.showMyToastMessage(simpleResponseModel!.messages ?? '');
    }
  }

  Future<void> deleteInviteApi(String inviteId) async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.inviteId: inviteId,
    };
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.deleteCollaboratorsInviteApi(bodyParams: bodyParams);
    if (simpleResponseModel != null) {
      showLoading.value = true;
      getCollaboratorsInvitedUserApi();
    } else {
      CommonWidgets.showMyToastMessage(simpleResponseModel!.messages ?? '');
    }
  }
}
