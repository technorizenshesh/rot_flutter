import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/recharge_done_controller.dart';

class RechargeDoneView extends GetView<RechargeDoneController> {
  const RechargeDoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.recharge),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                SizedBox(height: 100.px),
                CommonWidgets.appIcons(
                  assetName: ImageConstants.imageRechargeCarriedOut,
                  height: 220.px,
                  width: double.infinity,
                ),
                SizedBox(height: 100.px),
                Text(
                  StringConstants.rechargeCarriedOut,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 18.px),
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.theMoneyIsAlready,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 14.px),
                ),
                SizedBox(height: 100.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnGoToWallet(),
                  childText: Text(
                    StringConstants.goToWallet,
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
        ],
      ),
    );
  }
}
