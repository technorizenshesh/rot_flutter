import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/check_your_mail_controller.dart';

class CheckYourMailView extends GetView<CheckYourMailController> {
  const CheckYourMailView({Key? key}) : super(key: key);

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
                      StringConstants.checkYourMail,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 22.px),
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      StringConstants.pleasePutTheSixDigitsSentToYou,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 16.px),
                    ),
                    SizedBox(height: 74.px),
                    CommonWidgets.commonOtpView(controller: controller.pin),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
