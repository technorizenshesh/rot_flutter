import 'package:get/get.dart';

import '../controllers/invite_collaborator_choose_a_role_confirm_controller.dart';

class InviteCollaboratorChooseARoleConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteCollaboratorChooseARoleConfirmController>(
      () => InviteCollaboratorChooseARoleConfirmController(),
    );
  }
}
