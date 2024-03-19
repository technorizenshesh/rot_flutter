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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
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
                      subtitle: Text(
                        controller.list[index]['subtitle'],
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              fontSize: 14.px,
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
                        groupValue: controller.selectedValue.value,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          controller.selectedValue.value =
                              controller.list[index]['title'];
                        },
                      ),
                    ),
                  ),
                );
              }),
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
                      controller.productDetailsModel.data!.productName ?? '',
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
                            '${CommonMethods.cur}${controller.productDetailsModel.data!.price}',
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
          SizedBox(height: 20.px),
        ],
      ),
    );
  }
}
