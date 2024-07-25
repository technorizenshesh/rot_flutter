import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/delivery_controller.dart';

class DeliveryView extends GetView<DeliveryController> {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.delivery.tr),
        body: Obx(() {
          controller.count.value;
          return Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.list.length,
                itemBuilder: (context, index) => Obx(() {
                  controller.count.value;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.px),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Theme.of(Get.context!)
                            .primaryColor, // Set the inactive color here
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.px, vertical: 0.px),
                        subtitle: Text(
                          controller.list[index]['subtitle'],
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontSize: 13.px,
                              ),
                        ),
                        title: Text(
                          controller.list[index]['title'],
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                        leading: CommonWidgets.appIcons(
                            assetName: controller.list[index]['icon']),
                        trailing: Radio(
                          value: controller.list[index]['title'],
                          groupValue: controller.selectedPhysicalValue.value,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (value) {
                            controller.selectedPhysicalValue.value =
                                controller.list[index]['title'];
                            controller.selectedDeliveryValue.value =
                                index == 0 ? '0' : '3.99';
                            controller.deliveryTypeCourierIndex = -1;
                            controller.deliveryTypeCourier.value = false;
                            controller.increment();
                            //controller.selectedValue.value = controller.list[index]['title'];
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
              ListTile(
                onTap: () {
                  controller.clickOnMyAddress();
                },
                title: Text(
                  'Select Delivery Types',
                  style:
                      Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                            fontSize: 16.px,
                          ),
                ),
                subtitle: Text(
                  'My Address : ( ${controller.myAddress.value} )',
                  style:
                      Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                            fontSize: 12.px,
                          ),
                ),
              ),
              if (controller.companyName.value.isNotEmpty)
                Text(
                  'Courier Company: ${controller.companyName.value}',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.px,
                      ),
                ),
              controller.presentShipment.value
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.deliveryList.length,
                        itemBuilder: (context, index) => Obx(() {
                          controller.count.value;
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.px),
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Theme.of(Get.context!)
                                    .primaryColor, // Set the inactive color here
                              ),
                              child: ListTile(
                                subtitle: Text(
                                  controller.deliveryList[index]['subtitle'],
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      '${controller.deliveryList[index]['title']} €',
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 14.px,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 10.px,
                                    ),
                                    Text(
                                      '(${controller.deliveryList[index]['type']} )',
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 12.px,
                                          ),
                                    ),
                                  ],
                                ),
                                leading: CommonWidgets.appIcons(
                                    assetName: controller.deliveryList[index]
                                        ['icon']),
                                trailing: Radio(
                                  value: index,
                                  groupValue:
                                      controller.deliveryTypeCourierIndex,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {
                                    controller.selectedDeliveryValue.value =
                                        controller.deliveryList[index]['title'];
                                    controller.deliveryTypeCourierIndex = index;
                                    controller.deliveryTypeCourier.value = true;
                                    controller.selectedPhysicalValue.value =
                                        '0';
                                    controller.increment();
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.px),
                      child: ListTile(
                        onTap: () {
                          controller.clickOnChat();
                        },
                        title: Text(
                          StringConstants.shipmentAreNotPresentAtYourAddress,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                        subtitle: Text(
                          'Send request for shipment',
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                fontSize: 12.px,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.px,
                          color: Colors.teal,
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.all(16.px),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: CommonWidgets.imageView(
                      image: controller.productDetailsModel.data!.productImage!
                              .isNotEmpty
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
                                '${CommonMethods.cur}${(double.parse(controller.productDetailsModel.data!.price ?? '0') + double.parse(controller.selectedDeliveryValue.value)).toStringAsFixed(2)}',
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
                            /*  Flexible(
                          child: Text(
                            '${CommonMethods.cur}465.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                          ),
                        ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Padding(
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
              ),
            ],
          );
        }));
  }
}
