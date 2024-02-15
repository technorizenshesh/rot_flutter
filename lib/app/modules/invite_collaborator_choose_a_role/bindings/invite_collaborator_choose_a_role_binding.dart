import 'package:get/get.dart';

import '../controllers/invite_collaborator_choose_a_role_controller.dart';

class InviteCollaboratorChooseARoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteCollaboratorChooseARoleController>(
      () => InviteCollaboratorChooseARoleController(),
    );
  }
}
