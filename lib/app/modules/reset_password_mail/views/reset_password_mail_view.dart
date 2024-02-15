import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import '../controllers/reset_password_mail_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class ResetPasswordMailView extends GetView<ResetPasswordMailController> {
  const ResetPasswordMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnNextButton(),
                  childText: Text(
                    StringConstants.next,
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
          appBar: CommonWidgets.appBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.passwordReset,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 24.px),
                ),
                SizedBox(height: 6.px),
                Text(
                  StringConstants.pleasePutYourEmailToResetYourPassword,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 16.px),
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
                        : Theme.of(Get.context!)
                            .colorScheme
                            .onSecondaryContainer,
                  ),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
        ),
      );
    });
  }
}
