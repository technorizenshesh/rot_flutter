import 'package:get/get.dart';
import '../../chats/views/chats_view.dart';
import '../../favorites/views/favorites_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../upload/views/upload_view.dart';

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
        return const HomeView();
      case 1:
        return const FavoritesView();
      case 2:
        return const UploadView();
      case 3:
        return const ChatsView();
      case 4:
        return const ProfileView();
    }
  }
}
