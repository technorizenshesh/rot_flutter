import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/create_new_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({Key? key}) : super(key: key);

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
                  onPressed: () => controller.clickOnSubmitButton(),
                  childText: Text(
                    StringConstants.submit.tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
          appBar: CommonWidgets.appBar(),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.createNewPassword.tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 24.px),
                  ),
                  SizedBox(height: 6.px),
                  Text(
                    StringConstants
                        .yourNewPasswordMustBeDifferentFromPreviousUsedPasswords
                        .tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    obscureText: !controller.hideNewPassword.value,
                    focusNode: controller.focusNewPassword,
                    title: StringConstants.newPassword.tr,
                    controller: controller.newPasswordController,
                    isCard: controller.isNewPassword.value,
                    prefixIcon: CommonWidgets.appIcons(
                        assetName: IconConstants.icPasswordInActive,
                        color: controller.isNewPassword.value
                            ? Theme.of(Get.context!).primaryColor
                            : Theme.of(Get.context!)
                                .colorScheme
                                .onSecondaryContainer),
                    hintText: StringConstants.pleaseEnterNewPassword.tr,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.clickOnEyeNewPasswordButton(),
                      child: CommonWidgets.appIcons(
                        assetName: controller.hideNewPassword.value
                            ? IconConstants.icView
                            : IconConstants.icHide,
                        color: controller.isNewPassword.value
                            ? Theme.of(Get.context!).primaryColor
                            : Theme.of(Get.context!)
                                .colorScheme
                                .onSecondaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    obscureText: !controller.hideConfirmPassword.value,
                    focusNode: controller.focusConfirmPassword,
                    title: StringConstants.confirmPassword.tr,
                    controller: controller.newPasswordController,
                    isCard: controller.isConfirmPassword.value,
                    prefixIcon: CommonWidgets.appIcons(
                        assetName: IconConstants.icPasswordInActive,
                        color: controller.isConfirmPassword.value
                            ? Theme.of(Get.context!).primaryColor
                            : Theme.of(Get.context!)
                                .colorScheme
                                .onSecondaryContainer),
                    hintText: StringConstants.pleaseEnterConfirmPassword.tr,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.clickOnEyeConfirmPasswordButton(),
                      child: CommonWidgets.appIcons(
                        assetName: controller.hideConfirmPassword.value
                            ? IconConstants.icView
                            : IconConstants.icHide,
                        color: controller.isConfirmPassword.value
                            ? Theme.of(Get.context!).primaryColor
                            : Theme.of(Get.context!)
                                .colorScheme
                                .onSecondaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.px),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
