import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/get_start_controller.dart';

class GetStartView extends GetView<GetStartController> {
  const GetStartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(16.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                StringConstants.chooseTheLanguageFamiliarToYou.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).primaryColor, fontSize: 20.px),
              ),
              SizedBox(height: 30.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnEnglish(),
                child: Row(
                  children: [
                    CommonWidgets.appIcons(
                      width: 24.px,
                      height: 24.px,
                      assetName: IconConstants.icEnglish,
                    ),
                    SizedBox(width: 20.px),
                    Text(
                      StringConstants.english.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 20.px,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnSpanish(),
                child: Row(
                  children: [
                    CommonWidgets.appIcons(
                      width: 24.px,
                      height: 24.px,
                      assetName: IconConstants.icSpanish,
                    ),
                    SizedBox(width: 14.px),
                    Text(
                      StringConstants.spanish.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 20.px,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Image.asset(
            ImageConstants.imageLogo,
            height: 80.px,
            width: 280.px,
          ),
        ),
      );
    });
  }
}
