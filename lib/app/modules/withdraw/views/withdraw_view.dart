import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.withdraw),
        body: Obx(() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: ListView(
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.howMuchMoney,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 18.px),
                ),
                SizedBox(height: 20.px),
                Card(
                  elevation: .4.px,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.px)),
                  child: Padding(
                    padding: EdgeInsets.all(20.px),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: Text(
                                cSymbol(controller.withdrawCurrency.value),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 14.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: 5.px,
                            ),
                            SizedBox(
                                width: 120.px,
                                child: TextFormField(
                                  controller: controller.amountController,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 60.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 60.px,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.changeSendMoney(value);
                                    }
                                  },
                                ))
                          ],
                        ),
                        SizedBox(height: 24.px),
                        Text(
                          '${StringConstants.available} ${cSymbol(controller.withdrawCurrency.value)} ${controller.availableBalance.value}',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        SizedBox(height: 10.px),
                        CommonWidgets.commonElevatedButton(
                          onPressed: () => controller.clickOnTransferToBank(),
                          childText: Text(
                            StringConstants.transferToLocalBank,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.px, vertical: 0.px),
                  title: Text(
                    StringConstants.fee.tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black87),
                  ),
                  trailing: Text(
                    '${controller.totalFee.value} ${cSymbol(controller.withdrawCurrency.value)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.px, vertical: 0.px),
                  title: Text(
                    StringConstants.totalToPay.tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black87),
                  ),
                  trailing: Text(
                    '${controller.totalPayMoney.value} ${cSymbol(controller.withdrawCurrency.value)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                ),
                SizedBox(height: 20.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnTransferToBank(),
                  childText: Text(
                    StringConstants.transferToInternationalBank,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.px, vertical: 0.px),
                  title: Text(
                    StringConstants.fee.tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black87),
                  ),
                  trailing: Text(
                    '${controller.totalFee.value} ${cSymbol(controller.withdrawCurrency.value)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.px, vertical: 0.px),
                  title: Text(
                    StringConstants.totalToPay.tr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black87),
                  ),
                  trailing: Text(
                    '${controller.totalPayMoney.value} ${cSymbol(controller.withdrawCurrency.value)}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
