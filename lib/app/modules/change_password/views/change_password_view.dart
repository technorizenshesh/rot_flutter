import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/common_methods.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
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
                    onPressed: () => controller.clickOnSaveButton(),
                    childText: Text(
                      StringConstants.save.tr,
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
            appBar:
                CommonWidgets.appBar(title: StringConstants.changePassword.tr),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.currentPasswordController,
                        isCard: controller.isCurrentPassword.value,
                        focusNode: controller.focusCurrentPassword,
                        obscureText: controller.currentPasswordHide.value,
                        title: StringConstants.currentPassword.tr,
                        hintText: StringConstants.currentPassword.tr,
                        hintTextColor: controller.isCurrentPassword.value,
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              controller.clickOnCurrentPasswordEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.currentPasswordHide.value
                                    ? IconConstants.icView
                                    : IconConstants.icHide,
                                color: controller.isCurrentPassword.value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                height: 18.px,
                                width: 18.px,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.newPasswordController,
                        isCard: controller.isNewPassword.value,
                        focusNode: controller.focusNewPassword,
                        obscureText: controller.newPasswordHide.value,
                        hintText: StringConstants.newPassword.tr,
                        title: StringConstants.newPassword.tr,
                        hintTextColor: controller.isNewPassword.value,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnNewPasswordEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.newPasswordHide.value
                                    ? IconConstants.icView
                                    : IconConstants.icHide,
                                color: controller.isNewPassword.value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                height: 18.px,
                                width: 18.px,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.confirmPasswordController,
                        isCard: controller.isConfirmPassword.value,
                        focusNode: controller.focusConfirmPassword,
                        obscureText: controller.confirmPasswordHide.value,
                        hintText: StringConstants.confirmPassword.tr,
                        hintTextColor: controller.isConfirmPassword.value,
                        title: StringConstants.confirmPassword.tr,
                        /*prefixIcon: Image.asset(
                          IconConstants.icLock,
                          color: controller.isConfirmPassword.value
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).colorScheme.onSecondary,
                        ),*/
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              controller.clickOnConfirmPasswordEyeButton(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.confirmPasswordHide.value
                                    ? IconConstants.icView
                                    : IconConstants.icHide,
                                color: controller.isConfirmPassword.value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.onSecondary,
                                height: 18.px,
                                width: 18.px,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
