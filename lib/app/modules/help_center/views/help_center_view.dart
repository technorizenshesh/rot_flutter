import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/image_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';

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
                Text(
                  '''What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
                  style: Theme.of(Get.context!).textTheme.titleMedium,
                ),
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
