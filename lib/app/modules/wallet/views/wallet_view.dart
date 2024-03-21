import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/common/common_methods.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.wallet),
      body: ListView(
        children: [
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Card(
              elevation: .4.px,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.px)),
              child: Padding(
                padding: EdgeInsets.all(20.px),
                child: Column(
                  children: [
                    Text(
                      'Principal. USD',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.px,
                              ),
                    ),
                    SizedBox(height: 10.px),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: CommonMethods.cur,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        TextSpan(
                          text: controller.parameters[ApiKeyConstants.wallet],
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 60.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonElevatedButton(
                      wantContentSizeButton: true,
                      decoration: const BoxDecoration(),
                      onPressed: () => controller.clickOnAccounts(),
                      childText: Text(
                        StringConstants.accounts,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10.px),
                    SizedBox(
                      height: 70.px,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            card(
                              assetName: IconConstants.icRecharge,
                              text: StringConstants.recharge,
                              onTap: () => controller.clickOnRecharge(),
                            ),
                            card(
                              assetName: IconConstants.icCharge,
                              text: StringConstants.charge,
                              onTap: () => controller.clickOnCharge(),
                            ),
                            card(
                              assetName: IconConstants.icSendMoney,
                              text: StringConstants.sendMoney,
                              onTap: () => controller.clickOnSendMoney(),
                            ),
                            card(
                              assetName: IconConstants.icPay,
                              text: StringConstants.pay,
                              onTap: () => controller.clickOnPay(),
                            ),
                            card(
                              assetName: IconConstants.icWithdraw,
                              text: StringConstants.withdraw,
                              onTap: () => controller.clickOnWithDraw(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.px),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.px),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () => controller.clickOnListTile(index: index),
                          leading: CommonWidgets.appIcons(
                            assetName: controller.listOfListTile[index]['icon'],
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
                            controller.listOfListTile[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Divider(
                          height: 2.px,
                          color: Theme.of(context).colorScheme.onSecondary,
                          thickness: .2.px,
                        ),
                      ],
                    ),
                  ),
              itemCount: controller.listOfListTile.length),
          SizedBox(height: 12.px),
        ],
      ),
    );
  }

  Widget card(
      {required String assetName,
      required String text,
      GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.px),
      child: Padding(
        padding: EdgeInsets.all(4.px),
        child: Column(
          children: [
            CommonWidgets.appIcons(
              assetName: assetName,
              width: 40.px,
              height: 40.px,
              borderRadius: 20.px,
            ),
            SizedBox(height: 6.px),
            Text(
              text,
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                    fontSize: 12.px,
                    color: Theme.of(Get.context!).primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
