import 'package:get/get.dart';
import 'package:rot/app/modules/chats/controllers/chats_controller.dart';
import 'package:rot/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:rot/app/modules/upload/controllers/upload_controller.dart';
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
    Get.lazyPut<UploadController>(
      () => UploadController(),
    );
    Get.lazyPut<ChatsController>(
      () => ChatsController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
