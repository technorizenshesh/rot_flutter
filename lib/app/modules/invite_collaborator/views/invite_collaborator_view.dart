import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';

import '../controllers/invite_collaborator_controller.dart';

class InviteCollaboratorView extends GetView<InviteCollaboratorController> {
  const InviteCollaboratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.inviteCollaborator),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Text(
                StringConstants.enterTheEmailOfTheCollaborator,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 40.px),
              Text(
                StringConstants.keepInMindThatYourEmailMust,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14.px),
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                focusNode: controller.focusEmail,
                title: StringConstants.email,
                controller: controller.emailController,
                isCard: controller.isEmail.value,
                hintText: StringConstants.enterYourEmail,
                prefixIcon: CommonWidgets.appIcons(
                  assetName: IconConstants.icEmail,
                  color: controller.isEmail.value
                      ? Theme.of(Get.context!).primaryColor
                      : Theme.of(Get.context!).colorScheme.onSecondaryContainer,
                ),
              ),
              SizedBox(height: 8.px),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: StringConstants.protectedByReCAPTCHA,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 12.px),
                  ),
                  TextSpan(
                    text: StringConstants.privacy,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 12.px,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  TextSpan(
                    text: ' - ',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 12.px,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  TextSpan(
                    text: StringConstants.conditions,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 12.px,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ]),
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnContinueButton(),
                childText: Text(
                  StringConstants.continueText,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnGoBackButton(),
                buttonColor: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(.6.px),
                childText: Text(
                  StringConstants.goBack,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
    });
  }
}
