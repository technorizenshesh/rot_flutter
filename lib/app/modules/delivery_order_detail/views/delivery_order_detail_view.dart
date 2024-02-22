import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/delivery_order_detail_controller.dart';

class DeliveryOrderDetailView extends GetView<DeliveryOrderDetailController> {
  const DeliveryOrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.orderDetails.tr),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                SizedBox(height: 10.px),
                Divider(
                  height: 2.px,
                  color: Theme.of(context).colorScheme.onSecondary,
                  thickness: .2.px,
                ),
                SizedBox(height: 10.px),
                listTile(
                    assetName: IconConstants.icReceiveBack,
                    subtitle:
                        'The money you paid with the wallet is already in your account. You will receive the rest in the method you used within 24 to 48 hours'),
                listTile(
                    assetName: 'assets/un_used_images/collage2.png',
                    title: 'Item',
                    subtitle: 'iphone XR'),
                listTile(
                    assetName: IconConstants.icTotal,
                    title: 'Total',
                    subtitle: '242.16€'),
                listTile(
                    assetName: IconConstants.icUserImage,
                    title: 'Sold by:',
                    subtitle: 'JAVI-GTI..'),
                listTile(
                    assetName: IconConstants.icAddressPin,
                    title: 'Shipping address:',
                    subtitle:
                        'Via del corso Rome 305 98168 Villaggio Annunziata'),
                SizedBox(height: 20.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnKeepButton(),
                  childText: Text(
                    StringConstants.keep.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10.px),
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
