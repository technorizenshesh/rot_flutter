import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/sub_category_products_controller.dart';

class SubCategoryProductsView extends GetView<SubCategoryProductsController> {
  const SubCategoryProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          appBar: CommonWidgets.appBar(title: controller.title),
          body: ProgressBar(
            inAsyncCall: controller.inAsyncCall.value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 10),
              child: controller.data.isNotEmpty
                  ? SingleChildScrollView(
                      child: Wrap(
                        children:
                            List.generate(controller.data.length, (index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            // height: 280.px,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.px),
                              child: InkWell(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                borderRadius: BorderRadius.circular(14.px),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CommonWidgets.imageView(
                                          image: controller.data[index].image ??
                                              '',
                                          borderRadius:
                                              BorderRadius.circular(14.px),
                                          height: 140.px,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(4.px),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonWidgets.appIcons(
                                                assetName: controller
                                                    .listOfCards2[0]['icon1'],
                                                width: 40.px,
                                                height: 40.px,
                                              ),
                                              CommonWidgets.appIcons(
                                                assetName: controller
                                                    .listOfCards2[0]['icon2'],
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controller.data[index].price ??
                                                    '',
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      fontSize: 16.px,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                              ),
                                            ),
                                            CommonWidgets.appIcons(
                                              assetName:
                                                  IconConstants.icLikePrimary,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.px),
                                        Text(
                                          controller.data[index].productName ??
                                              '',
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(fontSize: 14.px),
                                        ),
                                        SizedBox(height: 10.px),
                                        Text(
                                          controller.data[index].description ??
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
                    )
                  : controller.getProductModel == null
                      ? const SizedBox()
                      : CommonWidgets.dataNotFound(),
            ),
          ));
    });
  }
}
