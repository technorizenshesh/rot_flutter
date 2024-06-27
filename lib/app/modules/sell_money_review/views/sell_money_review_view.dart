import 'package:country_flags/country_flags.dart';
import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sell_money_review_controller.dart';

class SellMoneyReviewView extends GetView<SellMoneyReviewController> {
  const SellMoneyReviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      controller.clickOnSellButton();
                    },
                    childText: Text(
                      '${StringConstants.sell.tr} ${controller.sendCurrencyName} to ${controller.recipientCurrencyName}',
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
            appBar: CommonWidgets.appBar(title: StringConstants.sellMoney.tr),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.sendMoneyController,
                        isCard: true,
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        title: StringConstants.sell.tr,
                        hintText: StringConstants.youSend.tr,
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CountryFlag.fromCountryCode(
                                    controller.parameter['sendCurrencyImage'] ??
                                        'US',
                                    height: 20.px,
                                    width: 25.px,
                                    borderRadius: 3,
                                  ),
                                  /*    Text(
                                    controller.sendCurrencyName.value,
                                    style: MTextThemeStyle.titleMedium()
                                        .copyWith(color: Colors.teal),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20.px,
                                    color: Colors.teal,
                                  ),*/
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.originOfFunds.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                      ),
                      SizedBox(height: 5.px),
                      Container(
                        height: 70.px,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.px,
                          ),
                        ),
                        child: controller.parameter['from'] == 'wallet'
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wallet',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.teal),
                                  ),
                                  Text(
                                    '${cSymbol(controller.sendCurrencyName.value)} ${controller.parameter['walletAmount']}  available',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstants.cardNumber,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.teal),
                                  ),
                                  Text(
                                    '${controller.parameter['cardNumber']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                  )
                                ],
                              ),
                      ),
                      SizedBox(height: 15.px),
                      Text(
                        StringConstants.fundsDestination.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                      ),
                      SizedBox(height: 5.px),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.px),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onTap: () {
                          controller.clickOnDeliverBank();
                        },
                        title: Text(
                          StringConstants.deliverToWalletMultiCurrency.tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                        ),
                        subtitle: Text(
                          controller.deliverBankAccount.value,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 10.px),
                      if (controller.parameter['from'] == 'wallet')
                        ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 2.px, vertical: 0.px),
                            title: Text(
                              StringConstants.availableLater,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87),
                            ),
                            trailing: Text(
                              '${controller.walletAvailableAmountLater.value} ${cSymbol(controller.sendCurrencyName.value)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
                            )),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 2.px, vertical: 0.px),
                          title: Text(
                            StringConstants.rate,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87),
                          ),
                          trailing: Text(
                            '1 ${cSymbol(controller.sendCurrencyName.value)} =${controller.converterRate.value} ${cSymbol(controller.recipientCurrencyName.value)}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                          )),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 2.px, vertical: 0.px),
                          title: Text(
                            StringConstants.exchange,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87),
                          ),
                          trailing: Text(
                            '${controller.recipientMoney.value} ${cSymbol(controller.recipientCurrencyName.value)}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                          )),
                      ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 2.px, vertical: 0.px),
                          title: Text(
                            '${StringConstants.fee.tr} 0.12%',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87),
                          ),
                          trailing: Text(
                            '${controller.totalFeeMoney.value} ${cSymbol(controller.recipientCurrencyName.value)}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                          )),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 2.px, vertical: 0.px),
                        title: Text(
                          StringConstants.totalToPay.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87),
                        ),
                        trailing: Text(
                          '${controller.totalPayMoney.value} ${cSymbol(controller.recipientCurrencyName.value)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                        ),
                      ),
                      SizedBox(height: 90.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
