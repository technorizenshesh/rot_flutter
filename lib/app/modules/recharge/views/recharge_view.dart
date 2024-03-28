import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/recharge_controller.dart';

class RechargeView extends GetView<RechargeController> {
  const RechargeView({Key? key}) : super(key: key);

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
              StringConstants.howMuchMoneyDoYouWantToRecharge,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text.rich(
                    //   TextSpan(children: [
                    //     TextSpan(
                    //       text: CommonMethods.cur,
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .displayMedium
                    //           ?.copyWith(
                    //             fontSize: 14.px,
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //     ),
                    //     TextSpan(
                    //       text: '0',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .displayMedium
                    //           ?.copyWith(
                    //             fontSize: 60.px,
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //     ),
                    //
                    //   ]),
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Text(
                            CommonMethods.cur,
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
                            width: 80.px,
                            child: TextFormField(
                              controller: controller.amountController,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 60.px,
                                      color: Theme.of(context).primaryColor),
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
                            ))
                      ],
                    ),
                    SizedBox(height: 24.px),
                    Text(
                      StringConstants.rateAccordingToTheAmountOfTheRecharge,
                      textAlign: TextAlign.start,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnReloadWallet(),
                      childText: Text(
                        StringConstants.reloadWallet,
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
            Obx(
              () => controller.showLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Obx(() => controller.presentData.value
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.cardList.length,
                          itemBuilder: (context, index) {
                            CardListData item = controller.cardList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.px),
                              child: ListTile(
                                onTap: () =>
                                    controller.clickOnListTile(index: index),
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
                                    assetName: index % 2 == 0
                                        ? 'assets/un_used_images/logos_visa.png'
                                        : 'assets/un_used_images/logos_mastercard.png',
                                    height: 30.px,
                                    width: 30.px,
                                    fit: BoxFit.fill,
                                    borderRadius: 0.px),
                                trailing: Text(
                                  StringConstants.edit,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                title: Text(
                                  "*************${item.cardNumber.toString().substring(item.cardNumber!.length - 4, item.cardNumber!.length)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 14.px),
                                ),
                                subtitle: Text(
                                  item.cardHolderName ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 12.px),
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox(
                          height: 150.px, child: CommonWidgets.dataNotFound())),
            ),
            SizedBox(height: 12.px),
          ],
        ),
      ),
    );
  }
}
