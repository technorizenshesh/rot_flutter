import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class InviteCollaboratorChooseARoleConfirmController extends GetxController {
  final count = 0.obs;
  final upValue = false.obs;

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

  clickOnGoBackButton() {}

  clickOnConfirmButton() {
    Get.toNamed(Routes.INVITE_COLLABORATOR_CHOOSE_A_ROLE_SEND_INVITATION);
  }

  clickOnIcon() {
    upValue.value = !upValue.value;
  }
}
