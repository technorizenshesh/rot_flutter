import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.help.tr),
      body: ListView(
        children: [
          SizedBox(height: 40.px),
          Center(
            child: Image.asset(
              ImageConstants.imageHelpPage,
              height: 150.px,
              width: 150.px,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.px),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidget(title: controller.list[index]['title']),
                    SizedBox(height: 20.px),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.list[index]['button'].length,
                      itemBuilder: (context, index1) {
                        return Column(
                          children: [
                            buttonWidget(
                              buttonText: controller.list[index]['button']
                                  [index1],
                            ),
                            SizedBox(height: 20.px),
                          ],
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 20.px),
          Center(
            child: Text(
              'Vesrion 1.0.0',
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                    fontSize: 18.px,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ),
          SizedBox(height: 8.px),
          Center(
            child: Text(
              StringConstants.rotAllRightsReserved.tr,
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                    fontSize: 18.px,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ),
          SizedBox(height: 20.px),
        ],
      ),
    );
  }

  titleWidget({required String title}) {
    return Text(
      title,
      style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
            fontSize: 18.px,
          ),
    );
  }

  buttonWidget({required String buttonText}) {
    return CommonWidgets.commonElevatedButton(
      buttonColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      onPressed: () => controller.clickOnButton(buttonText: buttonText),
      childText: Row(
        children: [
          Text(
            buttonText,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 14.px),
          ),
        ],
      ),
    );
  }
}
