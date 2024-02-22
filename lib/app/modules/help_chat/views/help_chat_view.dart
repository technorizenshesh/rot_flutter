import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/help_chat_controller.dart';

class HelpChatView extends GetView<HelpChatController> {
  const HelpChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.chat.tr),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.px),
                Image.asset(
                  ImageConstants.imageSupport,
                  height: 240.px,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.px),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.px, horizontal: 10.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.px),
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.2), // Background color
                  ),
                  child: TextField(
                    maxLines: 7,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Theme.of(Get.context!).primaryColor),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type Here",
                      hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnSubmitButton(),
                  childText: Text(
                    StringConstants.submit.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
