import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CommonWidgets.appBar(title: StringConstants.accounts.tr),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    '${cSymbol(controller.currencyName.value)} 0',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  subtitle: Text(
                    controller.currencyName.value,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  trailing: CommonWidgets.appIcons(
                      assetName: IconConstants.icFlagUsd,
                      height: 40.px,
                      width: 40.px,
                      fit: BoxFit.fill),
                ),
                SizedBox(height: 5.px),
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
                              : StringConstants
                                  .onlyForInternationalTransfers.tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 18.px,
                              ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      CommonWidgets.commonElevatedButton(
                        wantContentSizeButton: true,
                        border: const Border(),
                        borderRadius: 4.px,
                        onPressed: () => controller
                            .clickOnShareButton(controller.tabController.index),
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
                }),
                SizedBox(
                  height: 5.px,
                ),
                if (!controller.inAsyncCall.value)
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CommonWidgets.commonElevatedButton(
                            onPressed: () {
                              controller.clickOnEditButton();
                            },
                            childText: Text(
                              StringConstants.edit,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            buttonMargin: EdgeInsets.all(5.px)),
                      ),
                      Expanded(
                        flex: 1,
                        child: CommonWidgets.commonElevatedButton(
                            onPressed: () {
                              controller.clickOnSaveButton();
                            },
                            childText: Text(
                              StringConstants.save,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            buttonMargin: EdgeInsets.all(5.px)),
                      ),
                    ],
                  )
              ],
            ),
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
        /* ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.listOfData.length,
            itemBuilder: (context, index) {
              return ListTile(
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
              );
            }), */
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.localRecipient,
            hintText: controller.listOfData[0]['subtitle'],
            title: StringConstants.recipient.tr,
            titleStyle: TextStyle(
              fontSize: 14.px,
              color: Colors.teal,
            ),
            maxLines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(0);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(
          height: 10.px,
        ),
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.localWhere,
            hintText: controller.listOfData[1]['subtitle'],
            title: StringConstants.were.tr,
            maxLines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(1);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(
          height: 10.px,
        ),
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.localPassword,
            hintText: controller.listOfData[2]['subtitle'],
            title: StringConstants.dniCiPassword,
            maxLines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(2);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(
          height: 10.px,
        ),
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.localBankName,
            hintText: controller.listOfData[3]['subtitle'],
            title: StringConstants.bankNameAndAddress.tr,
            maxLines: 2,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(3);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(height: 10.px),
        CommonWidgets.commonTextFieldForLoginSignUP(
            title: StringConstants.phoneNumber.tr,
            controller: controller.localPhone,
            hintText: StringConstants.enterYourPhoneNumber.tr,
            horizontalPadding: 0,
            prefixIconHorizontal: 8,
            prefixIcon: CommonWidgets.countryCodePicker(
              onChanged: (value) => controller.clickOnCountryCode(value: value),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(4);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(height: 10.px),
        CommonWidgets.commonTextFieldForLoginSignUP(
            title: StringConstants.email,
            controller: controller.localEmail,
            hintText: StringConstants.enterYourEmail,
            prefixIcon: CommonWidgets.appIcons(
                assetName: IconConstants.icEmail,
                color: Theme.of(Get.context!).primaryColor),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(5);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
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
        /*  ListView.builder(
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
        ),*/
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.swiftRecipient,
            hintText: controller.listOfData[0]['subtitle'],
            title: StringConstants.recipient.tr,
            titleStyle: TextStyle(
              fontSize: 14.px,
              color: Colors.teal,
            ),
            maxLines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(6);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(
          height: 10.px,
        ),
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.swiftWhere,
            hintText: controller.listOfData[1]['subtitle'],
            title: StringConstants.were.tr,
            maxLines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(7);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(
          height: 10.px,
        ),
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.swiftSwiftCode,
            hintText: controller.listOfData[2]['subtitle'],
            title: StringConstants.bicSwiftCode,
            maxLines: 1,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(8);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(
          height: 10.px,
        ),
        CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.swiftBankName,
            hintText: controller.listOfData[3]['subtitle'],
            title: StringConstants.bankNameAndAddress.tr,
            maxLines: 2,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(9);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(height: 10.px),
        CommonWidgets.commonTextFieldForLoginSignUP(
            title: StringConstants.phoneNumber.tr,
            controller: controller.swiftPhone,
            hintText: StringConstants.enterYourPhoneNumber.tr,
            horizontalPadding: 0,
            prefixIconHorizontal: 8,
            prefixIcon: CommonWidgets.countryCodePicker(
              onChanged: (value) => controller.clickOnCountryCode(value: value),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(10);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
        SizedBox(height: 14.px),
        CommonWidgets.commonTextFieldForLoginSignUP(
            title: StringConstants.email,
            controller: controller.swiftEmail,
            hintText: StringConstants.enterYourEmail,
            prefixIcon: CommonWidgets.appIcons(
                assetName: IconConstants.icEmail,
                color: Theme.of(Get.context!).primaryColor),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clickOnCopyIcon(11);
              },
              child: Icon(
                Icons.copy,
                color: Colors.teal,
                size: 25.px,
              ),
            )),
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
