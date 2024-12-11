import 'package:get/get.dart';
import 'package:rot_application/app/modules/home/controllers/home_controller.dart';
import 'package:rot_application/app/modules/wish/views/wish_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_conversation_model.dart';
import '../../../data/apis/api_models/get_notification_model.dart';
import '../../../data/apis/api_models/get_wish_category_model.dart';
import '../../chats/views/chats_view.dart';
import '../../favorites/views/favorites_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

final areChangeProducts = false.obs;
final selectedIndex = 0.obs;
final isNotification = false.obs;
WishCategoryModel? myModel;
String userId = '';

class NavBarController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    getConversationListApi();
    getNotificationApi();
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

  Future<void> getConversationListApi() async {
    Map<String, dynamic> getChatParameters = {
      ApiKeyConstants.receiverId: userId
    };
    GetConversationModel? getConversationModel =
        await ApiMethods.getConversationList(bodyParams: getChatParameters);
    if (getConversationModel != null &&
        getConversationModel.result != null &&
        getConversationModel.result!.isNotEmpty) {
      for (int i = 0; i < getConversationModel.result!.length; i++) {
        if (getConversationModel.result![i].noOfMessage != 0) {
          isNotification.value = true;
          break;
        }
      }
    }
  }

  Future<void> getNotificationApi() async {
    Map<String, dynamic> getNotification = {ApiKeyConstants.userId: userId};
    NotificationModel? notificationModel =
        await ApiMethods.getNotification(queryParameters: getNotification);
    if (notificationModel != null &&
        notificationModel.data != null &&
        notificationModel.data!.isNotEmpty) {
      if (notificationModel.notificationCount != 0) {
        isNotification.value = true;
      }
    }
  }
}
