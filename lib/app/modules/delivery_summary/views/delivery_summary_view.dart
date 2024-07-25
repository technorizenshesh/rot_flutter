import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/delivery_summary_controller.dart';

class DeliverySummaryView extends GetView<DeliverySummaryController> {
  const DeliverySummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.summary.tr),
      body: Obx(() {
        controller.count.value;
        return ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.px),
              child: Container(
                padding: EdgeInsets.all(16.px),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.4.px),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.productDetailsModel.data!.productName ??
                              '',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                        Text(
                          '\$ ${controller.productDetailsModel.data!.price!}',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icRotProtection,
                      ),
                      title: Text(
                        StringConstants.rotProtectionFees.tr,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 12.px),
                      ),
                      trailing: Text(
                        '\$ 3.69',
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 10.px),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icShippingTruck,
                      ),
                      title: Text(
                        StringConstants.shipping.tr,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 12.px),
                      ),
                      trailing: Text(
                        '\$ ${controller.parameters['shipping_charge'] ?? '0'}',
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 10.px),
                      ),
                    ),
                    Divider(
                      height: 4.px,
                      color: Theme.of(context).colorScheme.onSecondary,
                      thickness: .4.px,
                    ),
                    SizedBox(height: 10.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.total.tr,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                        Text(
                          '\$ ${int.parse(controller.productDetailsModel.data!.price!) + double.parse(controller.parameters['shipping_charge'] ?? '0') + 3.39}',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.px),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: Theme.of(Get.context!)
                      .primaryColor, // Set the inactive color here
                ),
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.px),
                      Text(
                        StringConstants.myAddress.tr,
                        maxLines: 1,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 16.px,
                            ),
                      ),
                      SizedBox(height: 4.px),
                      InkWell(
                        onTap: () => controller.clickOnToEdit(0),
                        borderRadius: BorderRadius.circular(8.px),
                        child: Padding(
                          padding: EdgeInsets.all(8.px),
                          child: Text(
                            StringConstants.toEdit.tr,
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Obx(
                    () => Text(
                      controller.myAddress.value != null
                          ? controller.myAddress.value
                          : 'To Edit My Address',
                      maxLines: 2,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontSize: 14.px,
                          ),
                    ),
                  ),
                  leading: CommonWidgets.appIcons(
                      height: 34.px,
                      width: 34.px,
                      assetName: IconConstants.icLocation),
                ),
              ),
            ),
            controller.parameters['method'] == 'Card'
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.px),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Theme.of(Get.context!)
                            .primaryColor, // Set the inactive color here
                      ),
                      child: ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.px),
                            Text(
                              "Card *************${controller.parameters['card_number'].toString().substring(10, 14)}",
                              maxLines: 1,
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 16.px,
                                  ),
                            ),
                            SizedBox(height: 4.px),
                            InkWell(
                              onTap: () => controller.clickOnToEdit(1),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: Text(
                                  StringConstants.toEdit.tr,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          'Payment method',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                        leading: CommonWidgets.appIcons(
                            height: 34.px,
                            width: 34.px,
                            assetName: IconConstants.icCardPayment),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.px),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Theme.of(Get.context!)
                            .primaryColor, // Set the inactive color here
                      ),
                      child: ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.px),
                            Text(
                              'Wallet  ${controller.walletAmount.value}',
                              maxLines: 1,
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 16.px,
                                  ),
                            ),
                            SizedBox(height: 4.px),
                            InkWell(
                              onTap: () => controller.clickOnToEdit(1),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: Text(
                                  StringConstants.toEdit.tr,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          'Payment method',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                        leading: CommonWidgets.appIcons(
                            height: 34.px,
                            width: 34.px,
                            assetName: IconConstants.icWalletPayment),
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.px),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: Theme.of(Get.context!)
                      .primaryColor, // Set the inactive color here
                ),
                child: ListTile(
                  /* subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.clickOnToEdit(2);
                        },
                        borderRadius: BorderRadius.circular(8.px),
                        child: Padding(
                          padding: EdgeInsets.all(8.px),
                          child: Text(
                            StringConstants.toEdit.tr,
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ), */
                  title: CommonWidgets.commonTextFieldForLoginSignUP(
                    controller: controller.promotionalCode,
                    title: 'Promotional code',
                    hintText: 'Promotional code',
                    hintStyle:
                        Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              fontSize: 14.px,
                            ),
                  ),
                  leading: CommonWidgets.appIcons(
                      height: 34.px,
                      width: 34.px,
                      assetName: IconConstants.icPromotionalCode),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.px),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: CommonWidgets.imageView(
                    image: controller
                            .productDetailsModel.data!.productImage!.isNotEmpty
                        ? controller
                            .productDetailsModel.data!.productImage![0].image!
                        : '',
                    height: 100.px,
                    radius: 14.px,
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
                        controller.productDetailsModel.data!.title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontSize: 14.px, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        'Colour: ${controller.productDetailsModel.data!.color ?? ''}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${CommonMethods.cur}  ${int.parse(controller.productDetailsModel.data!.price!) + double.parse(controller.parameters['shipping_charge'] ?? '0') + 3.39}',
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
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Obx(() => controller.btnLoading.value
                ? Container(
                    height: 60,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: const CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.px.px),
                    child: CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnContinueButton(),
                      childText: Text(
                        StringConstants.continueText.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
            SizedBox(height: 20.px),
          ],
        );
      }),
    );
  }
}
