import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/delivery_purchases_on_the_way_controller.dart';

class DeliveryPurchasesOnTheWayView
    extends GetView<DeliveryPurchasesOnTheWayController> {
  const DeliveryPurchasesOnTheWayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.purchasesStatus.tr),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px.px),
          child: CommonWidgets.commonElevatedButton(
            onPressed: () => controller.clickOnHomeButton(),
            childText: Text(
              StringConstants.backHome.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Obx(() {
          controller.count.value;
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.appIcons(
                      assetName: ImageConstants.imageTheTransportCompany,
                      height: 160.px,
                      width: double.infinity,
                      borderRadius: 0.px,
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants
                          .theTransportCompanyAlreadyHasYourPackage.tr,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 18.px,
                              ),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.weWillNotify.tr,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: 16.px,
                              ),
                    ),
                    SizedBox(height: 20.px),
                    Divider(
                      height: 2.px,
                      color: Theme.of(context).colorScheme.onSecondary,
                      thickness: .2.px,
                    ),
                    ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.px),
                          Text(
                            controller.parameters['shipping_id'] ?? '',
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
                            onTap: () {},
                            borderRadius: BorderRadius.circular(8.px),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Text(
                                StringConstants.knowMore.tr,
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
                      title: Text(
                        StringConstants.shippingCade.tr,
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
                          assetName: IconConstants.icShippingDone),
                    ),
                    SizedBox(height: 10.px),
                    Divider(
                      height: 2.px,
                      color: Theme.of(context).colorScheme.onSecondary,
                      thickness: .2.px,
                    ),
                    SizedBox(height: 10.px),
                    ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 14.px),
                          InkWell(
                            onTap: () => controller.clickOnKnowMore(),
                            borderRadius: BorderRadius.circular(8.px),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Text(
                                StringConstants.knowMore.tr,
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
                      title: Text(
                        StringConstants.protectYour.tr,
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
                        assetName: IconConstants.icProProtection,
                      ),
                    ),
                    SizedBox(height: 10.px),
                    Divider(
                      height: 2.px,
                      color: Theme.of(context).colorScheme.onSecondary,
                      thickness: .2.px,
                    ),
                    SizedBox(height: 10.px),
                    Padding(
                      padding: EdgeInsets.all(16.px),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: CommonWidgets.imageView(
                            image: controller.productDetailsModel.data!
                                    .productImage!.isNotEmpty
                                ? controller.productDetailsModel.data!
                                    .productImage![0].image!
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
                                controller.productDetailsModel.data!.title ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.bold),
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
                                            color:
                                                Theme.of(context).primaryColor,
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
                    SizedBox(height: 20.px),
                  ],
                ),
              )
            ],
          );
        }));
  }
}
