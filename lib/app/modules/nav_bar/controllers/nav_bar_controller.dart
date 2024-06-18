import 'package:get/get.dart';
import 'package:rot_application/app/modules/home/controllers/home_controller.dart';
import 'package:rot_application/app/modules/wish/views/wish_view.dart';

import '../../chats/views/chats_view.dart';
import '../../favorites/views/favorites_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

final areChangeProducts = false.obs;
final selectedIndex = 0.obs;

class NavBarController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  body() {
    switch (selectedIndex.value) {
      case 0:
        if (areChangeProducts.value) {
          print("CHANGE PRODUCT......");
          Get.delete<HomeController>();
          Get.lazyPut<HomeController>(
            () => HomeController(),
          );
          return const HomeView();
        } else {
          print("NOT CHANGE PRODUCT......");
          return const HomeView();
        }
      case 1:
        return const FavoritesView();
      case 2:
        // Get.lazyPut<CategoriesController>(
        //   () => CategoriesController(),
        // );
        // return const CategoriesView();
        //return const UploadView();
        return const WishView();
      case 3:
        return const ChatsView();
      case 4:
        return const ProfileView();
    }
  }
}
