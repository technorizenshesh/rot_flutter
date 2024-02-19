import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/string_constants.dart';
import 'package:rot_application/common/common_widgets.dart';
import '../../../../common/common_methods.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/payment_method_controller.dart';

class PaymentMethodView extends GetView<PaymentMethodController> {
  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.payment),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Row(children: [
                Expanded(
                  flex: 1,
                  child: CommonWidgets.appIcons(
                    assetName: 'assets/un_used_images/image_head _phones.png',
                    height: 100.px,
                    borderRadius: 14.px,
                  ),
                ),
                SizedBox(width: 10.px),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mackbook Pro',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        'Colour: Made Blue',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${CommonMethods.cur}949.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: Text(
                              '${CommonMethods.cur}465.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.px),
                CommonWidgets.appIcons(
                  assetName: IconConstants.icLikePrimary,
                ),
              ]),
              SizedBox(height: 20.px),
              Card(
                elevation: .4.px,
                child: Padding(
                  padding: EdgeInsets.all(8.px),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.listOfListTile.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () =>
                                controller.clickOnListTile(index: index),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.px),
                              side: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary
                                    .withOpacity(.2.px),
                              ),
                            ),
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
                          getDetail(index: index),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnContinueButton(),
                childText: Text(
                  StringConstants.continueText,
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
                RadioListTile<String>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.px),
                  ),
                  visualDensity: VisualDensity.compact,
                  secondary: Image.asset(
                      'assets/un_used_images/logos_mastercard.png',
                      height: 24.px,
                      width: 24.px),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    'Axis Bank **** **** **** 8395',
                    style:
                        Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                              fontSize: 10.px,
                            ),
                  ),
                  value: "Hey",
                  groupValue: "newGroup",
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.px),
                  ),
                  secondary: Image.asset('assets/un_used_images/logos_visa.png',
                      height: 24.px, width: 24.px),
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(
                    'HDFC Bank **** **** **** 6246',
                    style:
                        Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                              fontSize: 10.px,
                            ),
                  ),
                  value: "Hey",
                  groupValue: "newGroup",
                  onChanged: (value) {},
                ),
                InkWell(
                  onTap: () {},
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
          Text(
            StringConstants.cardNumber,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 16.px),
          ),
          SizedBox(height: 20.px),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusCardNumber,
            title: StringConstants.cardNumber,
            controller: controller.cardNumberController,
            isCard: controller.isCardNumber.value,
            hintText: StringConstants.enterDigitCardNumber,
            borderRadius: 15.px,
            fillColor:
                Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.2),
          ),
          SizedBox(height: 20.px),
          Text(
            StringConstants.cardHoldersName,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 16.px),
          ),
          SizedBox(height: 20.px),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusCardHoldersName,
            title: StringConstants.cardHoldersName,
            controller: controller.cardHoldersNameController,
            isCard: controller.isCardHoldersName.value,
            hintText: StringConstants.nameOnCard,
            borderRadius: 15.px,
            fillColor:
                Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.2),
          ),
          SizedBox(height: 20.px),
          Text(
            StringConstants.validThru,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 16.px),
          ),
          SizedBox(height: 20.px),
          Row(
            children: [
              Expanded(
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusMonth,
                  title: StringConstants.month,
                  controller: controller.monthController,
                  isCard: controller.isMonth.value,
                  hintText: StringConstants.month,
                  borderRadius: 15.px,
                  fillColor: Theme.of(Get.context!)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.2),
                ),
              ),
              const Expanded(child: SizedBox()),
              Expanded(
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusYear,
                  title: StringConstants.year,
                  controller: controller.yearController,
                  isCard: controller.isYear.value,
                  hintText: StringConstants.year,
                  borderRadius: 15.px,
                  fillColor: Theme.of(Get.context!)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.2),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.px),
          Text(
            StringConstants.cvv,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 16.px),
          ),
          SizedBox(height: 20.px),
          CommonWidgets.commonTextFieldForLoginSignUP(
            obscureText: controller.hideCvv.value,
            focusNode: controller.focusCvv,
            title: StringConstants.cvv,
            controller: controller.cvvController,
            isCard: controller.isCvv.value,
            hintText: StringConstants.cvv,
            borderRadius: 15.px,
            fillColor:
                Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.2),
            suffixIcon: GestureDetector(
              onTap: () => controller.clickOnEyeButton(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    controller.hideCvv.value
                        ? IconConstants.icView
                        : IconConstants.icHide,
                    color: Theme.of(Get.context!).colorScheme.onSecondary,
                    height: 18.px,
                    width: 18.px,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.px),
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
                child: Text(
                  StringConstants.youPay,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
              ),
              Expanded(
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
                      text: '0',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 60.px,
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
                child: Text(
                  StringConstants.available,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
              ),
              Expanded(
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
                      text: '100',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 60.px,
                            color: Theme.of(Get.context!).primaryColor,
                          ),
                    ),
                  ]),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          SizedBox(height: 8.px)
        ],
      );
    } else {
      return SizedBox(height: 8.px);
    }
  }
}
