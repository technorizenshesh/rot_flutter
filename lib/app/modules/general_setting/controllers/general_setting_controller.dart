import 'package:get/get.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/routes/app_pages.dart';

class GeneralSettingController extends GetxController {
  final count = 0.obs;

  List listOfListTile = [
    {
      'title': StringConstants.notification,
      'icon': IconConstants.icNotification
    },
    {
      'title': StringConstants.twoStepVerification,
      'icon': IconConstants.icTwoStepVerification
    },
    {'title': StringConstants.appUnlock, 'icon': IconConstants.icAppUnlock},
    {
      'title': StringConstants.linkedDevices,
      'icon': IconConstants.icLinkedDevices
    },
    {
      'title': StringConstants.collaborator,
      'icon': IconConstants.icCollaborator
    },
  ];

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

  clickOnListTile({required int index}) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.NOTIFICATION);
        break;
      case 1:
        Get.toNamed(Routes.TWO_STEP_VERIFICATION);
        break;
      case 2:
        Get.toNamed(Routes.APP_UNLOCK);
        break;
      case 3:
        Get.toNamed(Routes.LINKED_DEVICES);
        break;
      case 4:
        Get.toNamed(Routes.COLLABORATOR);
        break;
    }
  }
}
