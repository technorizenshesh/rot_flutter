import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/delivery_purchases_status_controller.dart';

class DeliveryPurchasesStatusView
    extends GetView<DeliveryPurchasesStatusController> {
  const DeliveryPurchasesStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.purchasesStatus.tr),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                CommonWidgets.appIcons(
                  assetName: IconConstants.icReturnMade,
                  height: 130.px,
                  width: 130.px,
                  borderRadius: 0.px,
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.purchaseMade.tr,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 18.px,
                      ),
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.theSellerHas.tr,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 16.px,
                      ),
                ),
                SizedBox(height: 20.px),
                Divider(
                  height: 2.px,
                  color: Theme.of(context).colorScheme.onSecondary,
                  thickness: .2.px,
                ),
                listTile(
                  assetName: IconConstants.icRotProtection,
                  subtitle: StringConstants.weProtectYourPurchase.tr,
                ),
                SizedBox(height: 20.px),
              ],
            ),
          )
        ],
      ),
    );
  }

  listTile({String title = '', String assetName = '', String subtitle = ''}) {
    return Column(
      children: [
        SizedBox(height: 20.px),
        ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.px)),
          leading: CommonWidgets.appIcons(
            assetName: assetName,
            height: 44.px,
            width: 44.px,
            fit: BoxFit.contain,
            borderRadius: 0.px,
          ),
          title: Text(
            title,
            maxLines: 2,
            style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 12.px,
                ),
          ),
          subtitle: Text(
            subtitle,
            maxLines: 3,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontSize: 12.px,
                ),
          ),
        ),
        SizedBox(height: 10.px),
        Divider(
          height: 2.px,
          color: Theme.of(Get.context!).colorScheme.onSecondary,
          thickness: .2.px,
        ),
      ],
    );
  }
}
