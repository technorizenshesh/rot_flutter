import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                  height: 80.px,
                  width: 280.px,
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
                        StringConstants.enterYourPhoneNumber,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusPhone,
                        title: StringConstants.phoneNumber,
                        controller: controller.phoneController,
                        isCard: controller.icPhone.value,
                        hintText: StringConstants.enterYourPhoneNumber,
                        horizontalPadding: 0,
                        prefixIconHorizontal: 8,
                        prefixIcon: CommonWidgets.countryCodePicker(
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(height: 10.px),
                      InkWell(
                        borderRadius: BorderRadius.circular(4.px),
                        onTap: () => controller.clickOnResetPassword(),
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
                        onPressed: () => controller.clickOnGoogleButton(),
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
                        onPressed: () => controller.clickOnFacebookButton(),
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
                            controller.clickOnLoginWithEmailButton(),
                        childText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.appIcons(
                              width: 24.px,
                              height: 24.px,
                              assetName: IconConstants.icEmail,
                            ),
                            SizedBox(width: 14.px),
                            Text(
                              StringConstants.loginWithEmail,
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
