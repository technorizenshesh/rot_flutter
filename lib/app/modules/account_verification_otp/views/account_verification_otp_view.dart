import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/account_verification_otp_controller.dart';

class AccountVerificationOtpView
    extends GetView<AccountVerificationOtpController> {
  const AccountVerificationOtpView({Key? key}) : super(key: key);
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
            appBar: CommonWidgets.appBar(),
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.enterTheVerificationCode.tr,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 20.px,
                                color: Theme.of(Get.context!).primaryColor),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.pleasePutTheSixDigitsSentToYou.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      SizedBox(height: 74.px),
                      CommonWidgets.commonOtpView(
                          controller: controller.pin, length: 6),
                      SizedBox(height: 50.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () {
                          controller.clickOnNextButton();
                        },
                        childText: Text(
                          StringConstants.continueText.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 30.px),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SizedBox(
                            height: 40.px,
                            child: Text(
                              StringConstants.userAnotherMethod.tr,
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 16.px,
                                      color:
                                          Theme.of(Get.context!).primaryColor),
                            ),
                          ),
                        ),
                      ),
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
