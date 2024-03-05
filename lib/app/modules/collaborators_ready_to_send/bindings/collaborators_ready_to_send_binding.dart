import 'package:get/get.dart';

import '../controllers/collaborators_ready_to_send_controller.dart';

class CollaboratorsReadyToSendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollaboratorsReadyToSendController>(
      () => CollaboratorsReadyToSendController(),
    );
  }
}
