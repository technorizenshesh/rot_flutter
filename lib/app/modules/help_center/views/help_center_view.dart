import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/help_center_controller.dart';

class HelpCenterView extends GetView<HelpCenterController> {
  const HelpCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: controller.title),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.px),
                Center(
                  child: Image.asset(
                    getImageByTitle(title: controller.title),
                    height: 150.px,
                    width: 150.px,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.px),
                Obx(() => controller.showProgress.value
                    ? const CircularProgressIndicator()
                    : controller.helpCenterData.isNotEmpty
                        ? Text(
                            controller.helpCenterData[0].message ?? '',
                            style: Theme.of(Get.context!).textTheme.titleMedium,
                            textAlign: TextAlign.justify,
                          )
                        : const Text("There is not present any data")),
                SizedBox(height: 20.px),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getImageByTitle({required String title}) {
    switch (title) {
      case StringConstants.helpCenter:
        return ImageConstants.imageHelpCenter;
      case StringConstants.consultationInProgress:
        return ImageConstants.imageConsultationInProgress;
      case StringConstants.securityAdvice:
        return ImageConstants.imageSecurityAdvice;
      case StringConstants.coexistenceRules:
        return ImageConstants.imageCoexistenceRules;
      case StringConstants.legalWarning:
        return ImageConstants.imageLegaWarning;
      case StringConstants.privacyPolicies:
        return ImageConstants.imagePrivacyPolicy;
      case StringConstants.changeOfConsent:
        return ImageConstants.imageChangeOfConsent;
      case StringConstants.termsAndConditions:
        return ImageConstants.imageTermsAndConditions;
      default:
        return ImageConstants.imageHelpCenter;
    }
  }
}
