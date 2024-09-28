import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_collaborator_permission_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class InviteCollaboratorChooseARoleConfirmController extends GetxController {
  final count = 0.obs;
  final permissionCount = 0.obs;
  final upValue = false.obs;
  final showLoading = true.obs;
  List<CollaboratorPermissionData> permissionList = [];
  List<CollaboratorPermissionData> selectedPermissionList = [];
  Map<String, String?> parameters = Get.parameters;
  @override
  void onInit() {
    super.onInit();
    getCollaboratorPermissionApi();
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

  clickOnGoBackButton() {
    Get.back();
  }

  clickOnConfirmButton() {
    if (selectedPermissionList.isNotEmpty) {
      Map<String, String> data = {
        ApiKeyConstants.email: parameters[ApiKeyConstants.email] ?? '',
        ApiKeyConstants.role:
            parameters[ApiKeyConstants.role] ?? 'Administrator',
      };
      Get.toNamed(Routes.INVITE_COLLABORATOR_CHOOSE_A_ROLE_SEND_INVITATION,
          parameters: data, arguments: selectedPermissionList);
    } else {
      CommonWidgets.showMyToastMessage('Please select at least one role.');
    }
  }

  clickOnIcon() {
    upValue.value = !upValue.value;
  }

  void changeStatus(int index) {
    permissionList[index].status = !(permissionList[index].status ?? false);
    permissionCount.value = 0;
    selectedPermissionList.clear();
    for (int i = 0; i < permissionList.length; i++) {
      if (permissionList[i].status ?? false) {
        permissionCount.value++;
        selectedPermissionList.add(permissionList[i]);
      } else {}
    }
    increment();
  }

  Future<void> getCollaboratorPermissionApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.type: parameters[ApiKeyConstants.role] ?? 'Administrator',
    };
    CollaboratorPermissionModel? collaboratorPermissionModel =
        await ApiMethods.getCollaborationPermissionApi(bodyParams: bodyParams);
    if (collaboratorPermissionModel != null &&
        collaboratorPermissionModel.status == "1") {
      permissionList = collaboratorPermissionModel.data!;
    } else {
      CommonWidgets.showMyToastMessage(
          collaboratorPermissionModel!.message ?? '');
    }
    showLoading.value = false;
    increment();
  }
}
