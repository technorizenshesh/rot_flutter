import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class InviteCollaboratorChooseARoleController extends GetxController {
  final count = 0.obs;

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

  clickOnCreateNewRoleButton() {
    Get.toNamed(Routes.INVITE_COLLABORATOR_CHOOSE_A_ROLE_CONFIRM);
  }
}
