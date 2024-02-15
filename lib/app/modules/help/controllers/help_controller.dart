import 'package:get/get.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/routes/app_pages.dart';

class HelpController extends GetxController {
  final count = 0.obs;

  List list = [
    {
      'title': StringConstants.supportText,
      'button': [StringConstants.chat],
    },
    {
      'title': StringConstants.medium,
      'button': [
        StringConstants.helpCenter,
        StringConstants.consultationInProgress,
      ],
    },
    {
      'title': StringConstants.tipsAndRules,
      'button': [
        StringConstants.securityAdvice,
        StringConstants.coexistenceRules,
      ],
    },
    {
      'title': StringConstants.legal,
      'button': [
        StringConstants.legalWarning,
        StringConstants.termsAndConditions,
        StringConstants.privacyPolicies,
        StringConstants.changeOfConsent,
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
    if (StringConstants.chat == buttonText) {
      Get.toNamed(Routes.HELP_CHAT);
    } else {
      Get.toNamed(Routes.HELP_CENTER, parameters: {'title': buttonText});
    }
  }
}
