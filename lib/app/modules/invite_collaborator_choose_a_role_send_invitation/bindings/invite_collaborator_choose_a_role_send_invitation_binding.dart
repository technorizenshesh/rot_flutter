import 'package:get/get.dart';

import '../controllers/invite_collaborator_choose_a_role_send_invitation_controller.dart';

class InviteCollaboratorChooseARoleSendInvitationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteCollaboratorChooseARoleSendInvitationController>(
      () => InviteCollaboratorChooseARoleSendInvitationController(),
    );
  }
}
