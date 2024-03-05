import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.accounts.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.px),
              Text(
                StringConstants.message.tr,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 24.px, color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 20.px),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.1.px),
                  borderRadius: BorderRadius.circular(8.px),
                ),
                child: TabBar(
                  onTap: (value) {
                    controller.increment();
                  },
                  splashBorderRadius: BorderRadius.circular(8.px),
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.px),
                    color: Theme.of(context).primaryColor,
                  ),
                  labelColor: Theme.of(context).scaffoldBackgroundColor,
                  unselectedLabelColor:
                      Theme.of(context).textTheme.displayMedium?.color,
                  tabs: controller.tabs,
                  labelStyle:
                      Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 14.px,
                            color: Theme.of(context).primaryColor,
                          ),
                  indicatorSize:
                      TabBarIndicatorSize.tab, // Set indicatorSize to tab
                ),
              ),
              SizedBox(height: 20.px),
              Obx(() {
                controller.count.value;
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        controller.tabController.index == 0
                            ? StringConstants.onlyForLocalTransfers.tr
                            : StringConstants.onlyForInternationalTransfers.tr,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 18.px,
                                ),
                      ),
                    ),
                    SizedBox(width: 20.px),
                    CommonWidgets.commonElevatedButton(
                      wantContentSizeButton: true,
                      border: const Border(),
                      borderRadius: 4.px,
                      onPressed: () => controller.clickOnShareButton(),
                      childText: Row(
                        children: [
                          Text(
                            StringConstants.share.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 8.px),
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icShare,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            height: 18.px,
                            width: 18.px,
                            borderRadius: 0.px,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 8.px),
              Obx(() {
                controller.count.value;
                return Expanded(
                  child: screens(),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget screens() {
    switch (controller.tabController.index) {
      case 0:
        return const LocalView();
      default:
        return const SwiftView();
    }
  }
}

class LocalView extends GetView<AccountsController> {
  const LocalView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.listOfData.length,
          itemBuilder: (context, index) => ListTile(
            // onTap: () => controller.clickOnMessageTile(),
            // contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px)),
            trailing: CommonWidgets.appIcons(
              assetName: IconConstants.icCopy,
              height: 24.px,
              width: 24.px,
              borderRadius: 0.px,
            ),
            title: Text(
              controller.listOfData[index]['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(
              controller.listOfData[index]['subtitle'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.px,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
            ),
          ),
        ),
        SizedBox(height: 20.px),
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.listOfDataLocal.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
            // onTap: () => controller.clickOnMessageTile(),
            // contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px)),
            leading: CommonWidgets.appIcons(
              assetName: controller.listOfDataLocal[index]['icon'],
              height: 40.px,
              width: 40.px,
              borderRadius: 20.px,
            ),
            title: Text(
              controller.listOfDataLocal[index]['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.px,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
            ),
          ),
        ),
        SizedBox(height: 20.px),
        Text(
          StringConstants.document.tr,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 24.px,
              ),
        ),
        SizedBox(height: 20.px),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.px),
                child: ListTile(
                  leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icDocuments,
                    height: 40.px,
                    width: 40.px,
                  ),
                  trailing: Image.asset(
                    IconConstants.icRightArrow,
                    height: 24.px,
                    width: 24.px,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    'Bank statement',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              Divider(
                height: 2.px,
                color: Theme.of(context).colorScheme.onSecondary,
                thickness: .2.px,
              ),
            ],
          ),
          itemCount: 2,
        ),
      ],
    );
  }
}

class SwiftView extends GetView<AccountsController> {
  const SwiftView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.listOfData.length,
          itemBuilder: (context, index) => ListTile(
            // onTap: () => controller.clickOnMessageTile(),
            // contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px)),
            trailing: CommonWidgets.appIcons(
              assetName: IconConstants.icCopy,
              height: 24.px,
              width: 24.px,
              borderRadius: 0.px,
            ),
            title: Text(
              controller.listOfData[index]['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px, color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(
              controller.listOfData[index]['subtitle'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.px,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
            ),
          ),
        ),
        SizedBox(height: 20.px),
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.listOfDataLocal.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
            // onTap: () => controller.clickOnMessageTile(),
            // contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px)),
            leading: CommonWidgets.appIcons(
              assetName: controller.listOfDataLocal[index]['icon'],
              height: 40.px,
              width: 40.px,
              borderRadius: 20.px,
            ),
            title: Text(
              controller.listOfDataLocal[index]['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.px,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
            ),
          ),
        ),
        SizedBox(height: 20.px),
        Text(
          StringConstants.document.tr,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 24.px,
              ),
        ),
        SizedBox(height: 20.px),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.px),
                child: ListTile(
                  leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icDocuments,
                    height: 40.px,
                    width: 40.px,
                  ),
                  trailing: Image.asset(
                    IconConstants.icRightArrow,
                    height: 24.px,
                    width: 24.px,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    'Bank statement',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px, color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              Divider(
                height: 2.px,
                color: Theme.of(context).colorScheme.onSecondary,
                thickness: .2.px,
              ),
            ],
          ),
          itemCount: 2,
        ),
      ],
    );
  }
}
