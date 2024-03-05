import 'package:get/get.dart';

import '../controllers/collaborator_controller.dart';

class CollaboratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollaboratorController>(
      () => CollaboratorController(),
    );
  }
}
