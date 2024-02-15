import 'package:get/get.dart';
import 'package:rot/app/routes/app_pages.dart';

class CollaboratorController extends GetxController {
  //TODO: Implement CollaboratorController

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

  clickOnInviteCollaboratorButton() {
    Get.toNamed(Routes.COLLABORATORS_READY_TO_SEND);
  }

  clickOnManageRolesButton() {}
}
