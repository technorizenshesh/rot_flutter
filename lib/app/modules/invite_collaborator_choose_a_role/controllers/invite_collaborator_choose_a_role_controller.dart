import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../routes/app_pages.dart';

class InviteCollaboratorChooseARoleController extends GetxController {
  final count = 0.obs;
  final role = ''.obs;
  Map<String, String?> parameters = Get.parameters;
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

  clickOnGoBackButton() {
    Get.back();
  }

  clickOnCreateNewRoleButton() {
    if (role.value != '') {
      Map<String, String> data = {
        ApiKeyConstants.role: role.value,
        ApiKeyConstants.email: parameters[ApiKeyConstants.email] ?? ''
      };
      Get.toNamed(Routes.INVITE_COLLABORATOR_CHOOSE_A_ROLE_CONFIRM,
          parameters: data);
    } else {
      CommonWidgets.showMyToastMessage('Please select any role type...');
    }
  }
}
