import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_card_list_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/purchase_subscription_controller.dart';

class PurchaseSubscriptionView extends GetView<PurchaseSubscriptionController> {
  const PurchaseSubscriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar:
            CommonWidgets.appBar(title: StringConstants.purchaseSubscription),
        bottomNavigationBar: Obx(
          () => controller.buttonLoading.value
              ? Container(
                  height: 50.px,
                  margin:
                      EdgeInsets.only(left: 10.px, right: 10.px, bottom: 5.px),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.px),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnPurchaseButton(),
                  childText: Text(
                    StringConstants.purchases,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  buttonMargin:
                      EdgeInsets.only(left: 10.px, right: 10.px, bottom: 5.px)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Container(
                height: 180.px,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImageConstants.imageBackgroundCardPink,
                      ),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringConstants.rot,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 16.px,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                      Text(
                        '\$ ${controller.subscriptionData.amount}',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 24.px,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                      Text(
                        controller.subscriptionData.name ?? '',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 20.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                      Text(
                        controller.subscriptionData.description ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.px),
              Text(
                'Select payment method',
                style: Theme.of(context).textTheme.labelLarge,
              ),
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
                              left: 8.px, right: 8.px, top: 5.px, bottom: 5.px),
                          child: ListTile(
                            onTap: () =>
                                controller.clickOnListTile(index: index),
                            leading: CommonWidgets.appIcons(
                                assetName: controller.listOfListTile[index]
                                    ['icon']),
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
                  Card(
                    elevation: .4.px,
                    child: getDetail(index: controller.upValue.value),
                  ),
                ],
              ),
              SizedBox(height: 20.px),
            ],
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
                                onTap: () => controller.changeSelectedCardIndex(
                                    index: index),
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
                                  controller.selectedCard.value == index
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
          SizedBox(height: 14.px),
          CommonWidgets.commonElevatedButton(
            wantContentSizeButton: true,
            border: const Border(),
            borderRadius: 4.px,
            onPressed: () => controller.clickOnShareButton(),
            childText: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringConstants.share,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 8.px),
                CommonWidgets.appIcons(
                  assetName: IconConstants.icShare,
                  color: Theme.of(Get.context!).scaffoldBackgroundColor,
                  height: 18.px,
                  width: 18.px,
                  borderRadius: 0.px,
                ),
              ],
            ),
          ),
          SizedBox(height: 14.px),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusEmail,
            title: StringConstants.email,
            controller: controller.emailController,
            isCard: controller.isEmail.value,
            hintText: StringConstants.enterYourEmail,
            prefixIcon: CommonWidgets.appIcons(
              assetName: IconConstants.icEmail,
              color: controller.isEmail.value
                  ? Theme.of(Get.context!).primaryColor
                  : Theme.of(Get.context!).colorScheme.onSecondaryContainer,
            ),
          ),
          SizedBox(height: 14.px),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusFullName,
            title: StringConstants.fullName,
            controller: controller.fullNameController,
            isCard: controller.isFullName.value,
            hintText: StringConstants.enterYourFullName,
            prefixIcon: CommonWidgets.appIcons(
              assetName: IconConstants.icUser,
              color: controller.isFullName.value
                  ? Theme.of(Get.context!).primaryColor
                  : Theme.of(Get.context!).colorScheme.onSecondaryContainer,
            ),
          ),
          SizedBox(height: 14.px),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusPhoneNumber,
            title: StringConstants.phoneNumber,
            controller: controller.phoneNumberController,
            isCard: controller.isPhoneNumber.value,
            hintText: StringConstants.enterYourPhoneNumber,
            horizontalPadding: 0,
            prefixIconHorizontal: 8,
            prefixIcon: CommonWidgets.countryCodePicker(
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 8.px)
        ],
      );
    } else if (2 == index && controller.upValue.value == index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.px),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  StringConstants.youPay,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                      text: CommonMethods.cur,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 14.px,
                            color: Theme.of(Get.context!).primaryColor,
                          ),
                    ),
                    TextSpan(
                      text: controller.subscriptionData.amount,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 50.px,
                            color: Theme.of(Get.context!).primaryColor,
                          ),
                    ),
                  ]),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
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
                    Obx(
                      () => Text(
                        controller.walletAmount.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 50.px,
                              color: Theme.of(Get.context!).primaryColor,
                            ),
                      ),
                    )
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
