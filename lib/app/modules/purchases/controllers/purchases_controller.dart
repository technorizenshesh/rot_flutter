import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';

class PurchasesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;

  late TabController tabController;
  final tabs = [
    const Tab(text: StringConstants.completed),
    const Tab(text: StringConstants.ongoing),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnOngoing() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          children: [
            SizedBox(height: 20.px),
            Text(
              StringConstants.orderDetails,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18.px,
                  ),
            ),
            Expanded(
              child: ListView(
                children: [
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
                  listTile(
                      assetName: IconConstants.icBankCard,
                      title: 'Payment method: ',
                      subtitle: 'Bank card'),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ],
        ),
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
