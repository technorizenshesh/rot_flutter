import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/text_styles.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/change_controller.dart';

class ChangeView extends GetView<ChangeController> {
  const ChangeView({Key? key}) : super(key: key);
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
                    onPressed: () {},
                    childText: Text(
                      StringConstants.begin.tr,
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
            appBar: CommonWidgets.appBar(title: StringConstants.changeMoney.tr),
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
                        keyboardType: TextInputType.number,
                        title: StringConstants.youSend.tr,
                        hintText: StringConstants.youSend.tr,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.showMyCurrencyPicker(0);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.sendCurrencyName.value,
                                    style: MTextThemeStyle.titleMedium()
                                        .copyWith(color: Colors.teal),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20.px,
                                    color: Colors.teal,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onChanged: (value) {
                          controller.recipientMoneyController.text =
                              (int.parse(value) * 10860).toString();
                          controller.totalPayMoney.value =
                              (int.parse(value) + 199).toString();
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2.px),
                        title: Text(
                          StringConstants.rate.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.teal),
                        ),
                        trailing: Text(
                          '1,0860',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87),
                        ),
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.recipientMoneyController,
                        isCard: true,
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        hintText: StringConstants.recipientReceives.tr,
                        title: StringConstants.recipientReceives.tr,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.showMyCurrencyPicker(1);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.recipientCurrencyName.value,
                                    style: MTextThemeStyle.titleMedium()
                                        .copyWith(color: Colors.teal),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20.px,
                                    color: Colors.teal,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.payWithCardAndWallet.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                      ),
                      SizedBox(height: 10.px),
                      Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.px),
                            ),
                            elevation: .4.px,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.listOfListTile.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.px,
                                      right: 8.px,
                                      top: 5.px,
                                      bottom: 5.px),
                                  child: ListTile(
                                    onTap: () => controller.clickOnListTile(
                                        index: index),
                                    leading: CommonWidgets.appIcons(
                                        assetName: controller
                                            .listOfListTile[index]['icon']),
                                    title: Text(
                                      controller.listOfListTile[index]['title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(fontSize: 14.px),
                                    ),
                                    trailing: Icon(
                                      controller.upValue.value == index
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          getDetail(index: controller.upValue.value),
                        ],
                      ),
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
                          StringConstants.deliverToBankAccount.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
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

                      /* SizedBox(height: 10.px),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.px),
                        ),
                        child: Column(
                          children: [
                            Obx(() => controller.cardDataPresent.value
                                ? Obx(() {
                                    controller.count.value;
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.px, vertical: 0.px),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller.cardList.length,
                                      itemBuilder: (context, index) {
                                        CardListData item =
                                            controller.cardList[index];
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.px, horizontal: 4),
                                          child: ListTile(
                                            onTap: () => controller
                                                .changeReceivedSelectedCardIndex(
                                                    index: index),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.px,
                                                    vertical: 0.px),
                                            leading: CommonWidgets.appIcons(
                                                assetName: index % 2 == 0
                                                    ? 'assets/un_used_images/logos_visa.png'
                                                    : 'assets/un_used_images/logos_mastercard.png',
                                                height: 30.px,
                                                width: 30.px,
                                                fit: BoxFit.fill,
                                                borderRadius: 0.px),
                                            trailing: Icon(
                                              controller.selectedReceivedCard
                                                          .value ==
                                                      index
                                                  ? Icons.circle
                                                  : Icons.circle_outlined,
                                              color: Colors.teal,
                                              size: 20,
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
                                    );
                                  })
                                : SizedBox(
                                    height: 100.px,
                                    width: 100.px,
                                    child: CommonWidgets.dataNotFound())),
                            SizedBox(height: 20.px),
                            InkWell(
                              onTap: () {
                                controller.clickOnNewCard();
                              },
                              borderRadius: BorderRadius.circular(15.px),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.px, horizontal: 14.px),
                                child: Row(
                                  children: [
                                    Image.asset(IconConstants.icAddDotted,
                                        height: 24.px, width: 24.px),
                                    SizedBox(width: 10.px),
                                    Text(
                                      StringConstants.addNewCard,
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontSize: 10.px,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),*/
                      SizedBox(height: 10.px),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 2.px, vertical: 0.px),
                        title: Text(
                          StringConstants.fee.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87),
                        ),
                        trailing: Text(
                          '199 EUR',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 2.px, vertical: 0.px),
                        title: Text(
                          StringConstants.delivery.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87),
                        ),
                        trailing: Text(
                          'With in 24 hours',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                        ),
                      ),
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
                        trailing: Obx(() => Text(
                              '${controller.totalPayMoney.value} EUR',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
                            )),
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

  getDetail({required int index}) {
    if (0 == index && controller.upValue.value == index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.px),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.px),
            ),
            child: Column(
              children: [
                Obx(() => controller.cardDataPresent.value
                    ? Obx(() {
                        controller.count.value;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.cardList.length,
                          itemBuilder: (context, index) {
                            CardListData item = controller.cardList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.px, horizontal: 4),
                              child: ListTile(
                                onTap: () => controller
                                    .changePaySelectedCardIndex(index: index),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.px, vertical: 0.px),
                                leading: CommonWidgets.appIcons(
                                    assetName: index % 2 == 0
                                        ? 'assets/un_used_images/logos_visa.png'
                                        : 'assets/un_used_images/logos_mastercard.png',
                                    height: 30.px,
                                    width: 30.px,
                                    fit: BoxFit.fill,
                                    borderRadius: 0.px),
                                trailing: Icon(
                                  controller.selectedPayCard.value == index
                                      ? Icons.circle
                                      : Icons.circle_outlined,
                                  color: Colors.teal,
                                  size: 20,
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
                        );
                      })
                    : SizedBox(
                        height: 100.px,
                        width: 100.px,
                        child: CommonWidgets.dataNotFound())),
                SizedBox(height: 20.px),
                InkWell(
                  onTap: () {
                    controller.clickOnNewCard();
                  },
                  borderRadius: BorderRadius.circular(15.px),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.px, horizontal: 14.px),
                    child: Row(
                      children: [
                        Image.asset(IconConstants.icAddDotted,
                            height: 24.px, width: 24.px),
                        SizedBox(width: 10.px),
                        Text(
                          StringConstants.addNewCard,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                fontSize: 10.px,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.px),
        ],
      );
    } else if (1 == index && controller.upValue.value == index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.px),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  StringConstants.available,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.px),
                      child: Text(
                        CommonMethods.cur,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 14.px,
                              color: Theme.of(Get.context!).primaryColor,
                            ),
                      ),
                    ),
                    Text(
                      controller.parameter[ApiKeyConstants.wallet] ?? '0',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 50.px,
                            color: Theme.of(Get.context!).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          SizedBox(height: 5.px)
        ],
      );
    } else {
      return SizedBox(height: 8.px);
    }
  }
}
