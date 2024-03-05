import 'package:get/get.dart';

import '../controllers/help_chat_controller.dart';

class HelpChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpChatController>(
      () => HelpChatController(),
    );
  }
}
