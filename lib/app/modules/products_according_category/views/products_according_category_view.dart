import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/common/common_widgets.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/products_according_category_controller.dart';

class ProductsAccordingCategoryView
    extends GetView<ProductsAccordingCategoryController> {
  const ProductsAccordingCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(
            title: controller.parameters[ApiKeyConstants.categoryName]),
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  children: [
                    if (controller.allProductData.isNotEmpty)
                      SingleChildScrollView(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: List.generate(
                                controller.allProductData.length, (index) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                // height: 280.px,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.px),
                                  child: InkWell(
                                    onTap: () =>
                                        controller.clickOnCard(index: index),
                                    borderRadius: BorderRadius.circular(14.px),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            CommonWidgets.imageView(
                                              image: controller
                                                      .allProductData[index]
                                                      .image ??
                                                  '',
                                              borderRadius:
                                                  BorderRadius.circular(14.px),
                                              height: 140.px,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.px),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CommonWidgets.appIcons(
                                                    assetName: productIconStatus(
                                                        controller
                                                                .allProductData[
                                                                    index]
                                                                .availableAt ??
                                                            ''),
                                                    width: 40.px,
                                                    height: 40.px,
                                                  ),
                                                  CommonWidgets.appIcons(
                                                    assetName: getIcons(
                                                        controller
                                                                .allProductData[
                                                                    index]
                                                                .shipping ??
                                                            'Yes'),
                                                    width: 40.px,
                                                    height: 40.px,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10.px),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                            .allProductData[
                                                                index]
                                                            .price ??
                                                        '',
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                          fontSize: 16.px,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                  ),
                                                ),
                                                CommonWidgets.appIcons(
                                                  assetName: IconConstants
                                                      .icLikePrimary,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.px),
                                            Text(
                                              controller.allProductData[index]
                                                      .title ??
                                                  '',
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(fontSize: 14.px),
                                            ),
                                            SizedBox(height: 10.px),
                                            Text(
                                              controller.allProductData[index]
                                                      .description ??
                                                  '',
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            SizedBox(height: 10.px),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    if (controller.allProductData.isEmpty &&
                        !controller.inAsyncCall.value)
                      CommonWidgets.dataNotFound(),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
              SizedBox(height: 12.px),
            ],
          ),
        ),
      );
    });
  }

  String getIcons(String available) {
    switch (available) {
      case "Yes":
        return IconConstants.icTruck;
      case "No":
        return IconConstants.icPersonMoney;
      default:
        return IconConstants.icTruck;
    }
  }

  String productIconStatus(String available) {
    switch (available) {
      case "sold":
        return IconConstants.icPaid;
      case "reserved":
        return IconConstants.icReserve;
      case "paid":
        return IconConstants.icPaid;
      case "process":
        return IconConstants.icMoneyReceived;
      default:
        return IconConstants.icMoneyReceived;
    }
  }
}
