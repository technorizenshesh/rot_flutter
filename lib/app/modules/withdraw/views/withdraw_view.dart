import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
  const WithdrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.withdraw),
      body: Padding(
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
                          text: '6',
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
                    SizedBox(height: 24.px),
                    Text(
                      'Maximum \$ 5.00 Minimum \$ 0.50',
                      textAlign: TextAlign.start,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnTransferToBank(),
                      childText: Text(
                        StringConstants.transferToBank,
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
            SizedBox(height: 20.px),
          ],
        ),
      ),
    );
  }
}
