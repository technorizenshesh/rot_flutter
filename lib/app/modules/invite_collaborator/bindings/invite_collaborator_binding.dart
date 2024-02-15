import 'package:get/get.dart';

import '../controllers/invite_collaborator_controller.dart';

class InviteCollaboratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteCollaboratorController>(
      () => InviteCollaboratorController(),
    );
  }
}
