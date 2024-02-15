import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/image_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_methods.dart';
import 'package:rot/common/common_widgets.dart';
import '../controllers/login_with_email_controller.dart';

class LoginWithEmailView extends GetView<LoginWithEmailController> {
  const LoginWithEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstants.imageBackground),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 120.px),
                Image.asset(
                  ImageConstants.imageLogo,
                  height: 90.px,
                  width: 250.px,
                ),
                SizedBox(height: 60.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.login,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 24.px),
                      ),
                      SizedBox(height: 6.px),
                      Text(
                        StringConstants.enterYourEmail,
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
                        hintText: StringConstants.enterYourPhoneNumber,
                        prefixIcon: CommonWidgets.appIcons(
                          assetName: IconConstants.icEmail,
                          color: controller.isEmail.value
                              ? Theme.of(Get.context!).primaryColor
                              : Theme.of(Get.context!)
                                  .colorScheme
                                  .onSecondaryContainer,
                        ),
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        obscureText: controller.passwordHide.value,
                        focusNode: controller.focusPassword,
                        title: StringConstants.password,
                        controller: controller.passwordController,
                        isCard: controller.isPassword.value,
                        prefixIcon: CommonWidgets.appIcons(
                            assetName: IconConstants.icPasswordInActive,
                            color: controller.isPassword.value
                                ? Theme.of(Get.context!).primaryColor
                                : Theme.of(Get.context!)
                                    .colorScheme
                                    .onSecondaryContainer),
                        hintText: StringConstants.pleaseEnterPassword,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnPasswordEyeButton(),
                          child: CommonWidgets.appIcons(
                            assetName: controller.passwordHide.value
                                ? IconConstants.icView
                                : IconConstants.icHide,
                            color: controller.isPassword.value
                                ? Theme.of(Get.context!).primaryColor
                                : Theme.of(Get.context!)
                                    .colorScheme
                                    .onSecondaryContainer,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.px),
                      InkWell(
                        borderRadius: BorderRadius.circular(4.px),
                        onTap: () => controller.clickOnRestorePassword(),
                        child: Padding(
                          padding: EdgeInsets.all(8.px),
                          child: Text(
                            StringConstants.resetPassword,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnLoginButton(),
                        childText: Text(
                          StringConstants.login,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          StringConstants.or,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.px,
                              ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        buttonColor: Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () => controller.clickOnLoginButton(),
                        childText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.appIcons(
                              width: 24.px,
                              height: 24.px,
                              assetName: IconConstants.icGoogle,
                            ),
                            SizedBox(width: 14.px),
                            Text(
                              StringConstants.loginWithGoogle,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(Get.context!)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        buttonColor: Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () => controller.clickOnLoginButton(),
                        childText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.appIcons(
                              width: 24.px,
                              height: 24.px,
                              assetName: IconConstants.icFacebook,
                            ),
                            SizedBox(width: 14.px),
                            Text(
                              StringConstants.loginWithFacebook,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(Get.context!)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        buttonColor: Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () =>
                            controller.clickOnLoginWithPhoneButton(),
                        childText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.appIcons(
                              width: 24.px,
                              height: 24.px,
                              assetName: IconConstants.icPhone,
                            ),
                            SizedBox(width: 14.px),
                            Text(
                              StringConstants.loginWithPhone,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(Get.context!)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConstants.doNotHaveAnAccount,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                          InkWell(
                            onTap: () => controller.clickOnSignUpButton(),
                            borderRadius: BorderRadius.circular(4.px),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.px),
                              child: Text(
                                StringConstants.signUp,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.px),
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