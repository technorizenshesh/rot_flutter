import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/recharge_summary_controller.dart';

class RechargeSummaryView extends GetView<RechargeSummaryController> {
  const RechargeSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.recharge),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: ListView(
          children: [
            SizedBox(height: 20.px),
            Text(
              StringConstants.rechargeSummary,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 18.px),
            ),
            SizedBox(height: 20.px),
            ListTile(
              leading: CommonWidgets.appIcons(
                assetName: IconConstants.icBankCard,
                height: 40.px,
                width: 40.px,
              ),
              trailing: Text(
                '\$ ${getPercentage(controller.parameters[ApiKeyConstants.amount] ?? '0')}',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px, fontWeight: FontWeight.w400),
              ),
              title: Text(
                'Recharge fee',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20.px),
            ListTile(
              trailing: Text(
                '\$ ${controller.parameters[ApiKeyConstants.amount] ?? '0'}',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 20.px),
              ),
              title: Text(
                StringConstants.recharge,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20.px, color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 20.px),
            ListTile(
              trailing: Text(
                '\$ ${totalAmount(controller.parameters[ApiKeyConstants.amount] ?? '0')}',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 20.px),
              ),
              title: Text(
                StringConstants.total,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20.px, color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 20.px),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.px),
                side: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.4.px),
                ),
              ),
              leading: CommonWidgets.appIcons(
                  assetName: 'assets/un_used_images/logos_mastercard.png',
                  height: 40.px,
                  width: 40.px,
                  fit: BoxFit.fill),
              trailing: Text(
                StringConstants.edit,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor),
              ),
              title: Text(
                controller.cardListData.cardNumber ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14.px),
              ),
              subtitle: Text(
                controller.cardListData.cardHolderName ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 12.px),
              ),
            ),
            SizedBox(height: 10.px),
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnRecharge(),
              childText: Text(
                StringConstants.recharge,
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
    );
  }

  String getPercentage(String value) {
    double fee = double.parse(value) * 0.1;
    return fee.toStringAsFixed(2);
  }

  String totalAmount(String value) {
    double fee = (double.parse(value) * 0.1) + (double.parse(value));
    return fee.toStringAsFixed(2);
  }
}
