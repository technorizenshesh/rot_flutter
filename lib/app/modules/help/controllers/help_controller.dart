import 'package:get/get.dart';

import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class HelpController extends GetxController {
  final count = 0.obs;

  List list = [
    {
      'title': StringConstants.supportText.tr,
      'button': [StringConstants.chat.tr],
    },
    {
      'title': StringConstants.medium.tr,
      'button': [
        StringConstants.helpCenter.tr,
        StringConstants.consultationInProgress.tr,
      ],
    },
    {
      'title': StringConstants.tipsAndRules.tr,
      'button': [
        StringConstants.securityAdvice.tr,
        StringConstants.coexistenceRules.tr,
      ],
    },
    {
      'title': StringConstants.legal.tr,
      'button': [
        StringConstants.legalWarning.tr,
        StringConstants.termsAndConditions.tr,
        StringConstants.privacyPolicies.tr,
        StringConstants.changeOfConsent.tr,
      ],
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

  clickOnButton({required String buttonText}) {
    if (StringConstants.chat.tr == buttonText) {
      Get.toNamed(Routes.HELP_CHAT);
    } else {
      Get.toNamed(Routes.HELP_CENTER, parameters: {'title': buttonText});
    }
  }
}
