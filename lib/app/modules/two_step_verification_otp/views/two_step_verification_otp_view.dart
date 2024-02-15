import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';

import '../controllers/two_step_verification_otp_controller.dart';

class TwoStepVerificationOtpView
    extends GetView<TwoStepVerificationOtpController> {
  const TwoStepVerificationOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.twoStepVerification),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: ListView(
          children: [
            SizedBox(height: 20.px),
            Text(
              StringConstants.enterTheVerificationCode,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20.px,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(height: 20.px),
            Text(
              StringConstants.youReceived,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 14.px),
            ),
            SizedBox(height: 40.px),
            CommonWidgets.commonOtpView(controller: controller.pin),
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
              onPressed: () => controller.clickOnResendCodeButton(),
              buttonColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.6.px),
              childText: Text(
                StringConstants.resendCode,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.px),
            TextButton(
              onPressed: () {},
              child: Text(
                StringConstants.useAnotherMethod,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 18.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
    );
  }
}
