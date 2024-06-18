import 'package:get/get.dart';
import 'package:rot_application/app/modules/wish/controllers/wish_controller.dart';

import '../../chats/controllers/chats_controller.dart';
import '../../favorites/controllers/favorites_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FavoritesController>(
      () => FavoritesController(),
    );
    /*  Get.lazyPut<UploadController>(
      () => UploadController(),
    ); */
    Get.lazyPut<WishController>(
      () => WishController(),
    );
    Get.lazyPut<ChatsController>(
      () => ChatsController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
