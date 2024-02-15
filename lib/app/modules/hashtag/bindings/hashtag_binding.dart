import 'package:get/get.dart';

import '../controllers/hashtag_controller.dart';

class HashtagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HashtagController>(
      () => HashtagController(),
    );
  }
}
