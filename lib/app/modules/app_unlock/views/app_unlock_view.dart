import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/app_unlock_controller.dart';

class AppUnlockView extends GetView<AppUnlockController> {
  const AppUnlockView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.appUnlock),
      body: Column(
        children: [
          SizedBox(height: 20.px),
          ListTile(
            trailing: CupertinoSwitch(
              value: controller.switchValue.value,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (bool? value) {
                controller.switchValue.value = value ?? false;
              },
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.unlockingTheApp,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
                SizedBox(height: 8.px),
                Text(
                  StringConstants.youUseTouchId,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
