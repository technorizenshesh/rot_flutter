import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.pay),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.px),
            Image.asset(
              'assets/un_used_images/my_qr_code.png',
              height: 250.px,
              width: 250.px,
              fit: BoxFit.fill,
            ),
            Text(
              'QR number :${controller.qrNumber.value}',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px,
                  ),
            ),
            SizedBox(height: 10.px),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          cSymbol(controller.currencyName.value),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 20.px, color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        width: 5.px,
                      ),
                      SizedBox(
                          width: 180.px,
                          child: TextFormField(
                            controller: controller.amountController,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 16.px,
                                ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: StringConstants.specifyAnAmount,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 16.px,
                                  ),
                            ),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        controller.clickOnShareButton();
                      },
                      child: Container(
                        width: 100.px,
                        height: 40.px,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(StringConstants.shareQR,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px, color: Colors.white)),
                      )),
                )
              ],
            ),
            ListTile(
              onTap: () {
                controller.clickOnTransactionButton();
              },
              contentPadding: EdgeInsets.symmetric(vertical: 5.px),
              leading: CommonWidgets.appIcons(
                  assetName: IconConstants.icTransaction,
                  height: 40.px,
                  width: 40.px),
              title: Text(
                StringConstants.transactionHistory,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.px,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
