import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/modules/my_add_product_detail/controllers/my_add_product_detail_controller.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/read_more.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';

class MyAddProductDetailView extends GetView<MyAddProductDetailController> {
  const MyAddProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: controller.data != null
              ? ListView(
                  children: [
                    if (controller.data!.productImage != null &&
                        controller.data!.productImage!.isNotEmpty)
                      Container(
                        color:
                            Theme.of(context).primaryColor.withOpacity(.1.px),
                        child: Stack(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CarouselSlider(
                                  items: List.generate(
                                    controller.data!.productImage!.length,
                                    (index) => Container(
                                      // height: 200.px,
                                      // width: 200.px,
                                      height: 320.px,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: .4.px,
                                          color: Theme.of(Get.context!)
                                              .scaffoldBackgroundColor
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                      child: CommonWidgets.imageView(
                                        image: controller.data!
                                                .productImage![index].image ??
                                            '',
                                      ),
                                    ),
                                  ),
                                  options: CarouselOptions(
                                    height: 320.px,
                                    onPageChanged: (index, reason) {
                                      controller.cardIndex.value = index;
                                    },
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    enlargeStrategy:
                                        CenterPageEnlargeStrategy.zoom,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 1200),
                                    autoPlayCurve: Curves.easeOutSine,
                                    scrollDirection: Axis.horizontal,
                                    enlargeCenterPage: true,
                                    viewportFraction: 1,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 20.px,
                                    horizontal: 16.px,
                                  ),
                                  padding: EdgeInsets.all(4.px),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .withOpacity(.6.px),
                                    borderRadius: BorderRadius.circular(12.px),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Obx(
                                        () => Wrap(
                                          children: List.generate(
                                            controller
                                                .data!.productImage!.length,
                                            (index) => Padding(
                                              padding: EdgeInsets.all(2.px),
                                              child: Center(
                                                child: Container(
                                                  width: 6.px,
                                                  height: 6.px,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.px),
                                                    color: controller
                                                                .cardIndex.value ==
                                                            index
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.px, top: 20.px, right: 10.px),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.clickOnBackIcon(),
                                    child: CommonWidgets.appIcons(
                                        assetName: IconConstants.icBack,
                                        height: 32.px,
                                        width: 32.px,
                                        borderRadius: 0.px),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      CommonWidgets.showAlertDialog(
                                          title: StringConstants.edit,
                                          content:
                                              'Do you want to edit this post?',
                                          onPressedYes: () {});
                                    },
                                    child: Container(
                                      height: 34,
                                      width: 34,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.teal, width: 1.px)),
                                      child: const Icon(Icons.edit,
                                          size: 20, color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(width: 5.px),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(25.px),
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.px),
                                      child: CommonWidgets.appIcons(
                                          assetName: IconConstants.icShare,
                                          height: 24.px,
                                          width: 24.px,
                                          borderRadius: 0.px),
                                    ),
                                  ),
                                  SizedBox(width: 5.px),
                                  GestureDetector(
                                    onTap: () {
                                      CommonWidgets.showAlertDialog(
                                          title: StringConstants.delete,
                                          content:
                                              'Do you want to delete this post?',
                                          onPressedYes: () {
                                            controller.deleteProduct();
                                            Get.back();
                                          });
                                    },
                                    child: Container(
                                      height: 34,
                                      width: 34,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.teal, width: 1.px)),
                                      child: const Icon(Icons.more_vert,
                                          size: 20, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (controller.data!.productImage != null &&
                        controller.data!.productImage!.isNotEmpty)
                      SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.data!.productName ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 20.px),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 35.px,
                                width: 130.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.px),
                                    border: Border.all(
                                        color: Colors.teal, width: 1.px)),
                                child: const Text(
                                  "Sold",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                height: 35.px,
                                width: 130.px,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.px),
                                    border: Border.all(
                                        color: Colors.teal, width: 1.px)),
                                child: const Text(
                                  "Reserved",
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.px),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.data!.dateTime ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 10),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CommonWidgets.appIcons(
                                      assetName: IconConstants.icView,
                                      height: 24.px,
                                      width: 24.px,
                                      borderRadius: 24.px,
                                    ),
                                    SizedBox(width: 4.px),
                                    Expanded(
                                      child: Text(
                                        '285',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                    SizedBox(width: 5.px),
                                    CommonWidgets.appIcons(
                                        assetName: IconConstants.icLikePrimary,
                                        height: 24.px,
                                        width: 24.px,
                                        borderRadius: 0.px,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                                    SizedBox(width: 4.px),
                                    Expanded(
                                      child: Text(
                                        '150',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20.px),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    if (controller.data!.price != null &&
                                        controller.data!.price!.isNotEmpty &&
                                        controller.data!.discount != null &&
                                        controller.data!.discount!.isNotEmpty)
                                      Flexible(
                                        child: Text(
                                          CommonMethods.cur +
                                              ((int.parse(controller
                                                          .data!.price!)) -
                                                      ((int.parse(controller
                                                                  .data!
                                                                  .price!) /
                                                              100) *
                                                          int.parse(controller
                                                              .data!
                                                              .discount!)))
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 14.px,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      ),
                                    SizedBox(width: 10.px),
                                    if (controller.data!.price != null &&
                                        controller.data!.price!.isNotEmpty)
                                      Flexible(
                                        child: Text(
                                          CommonMethods.cur +
                                              controller.data!.price!
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary,
                                              ),
                                        ),
                                      ),
                                    SizedBox(width: 10.px),
                                    Flexible(
                                      child: Text(
                                        '${controller.data!.discount ?? ''} % Off',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.px),
                          ReadMoreText(
                            controller.data!.description ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                            lessStyle: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                            moreStyle: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                          SizedBox(height: 20.px),
                          Container(
                            padding: EdgeInsets.all(16.px),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.px),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.1.px),
                            ),
                            child: Row(children: [
                              CommonWidgets.appIcons(
                                assetName: IconConstants.icPlanet,
                                height: 28.px,
                                width: 28.px,
                                borderRadius: 0.px,
                              ),
                              SizedBox(width: 20.px),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'You can save money and help the planet when you buy second-hand products',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14.px,
                                          ),
                                    ),
                                    SizedBox(height: 10.px),
                                    Text(
                                      'More information',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            decorationColor:
                                                Theme.of(context).primaryColor,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14.px,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                          SizedBox(height: 20.px),
                          ListTile(
                            leading: CommonWidgets.appIcons(
                              assetName: IconConstants.icBike,
                              height: 30.px,
                              width: 30.px,
                              fit: BoxFit.fill,
                              borderRadius: 0.px,
                            ),
                            title: Text(
                              'Shipping Activated',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 16.px),
                            ),
                            trailing: Text(
                              'Edit',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.4.px),
                            thickness: .6,
                          ),
                          SizedBox(height: 4.px),
                          ListTile(
                            leading: CommonWidgets.appIcons(
                              assetName: IconConstants.icAddressPin,
                              height: 30.px,
                              width: 30.px,
                              fit: BoxFit.fill,
                              borderRadius: 0.px,
                            ),
                            title: Text(
                              'Location Item',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 16.px),
                            ),
                            subtitle: Text(
                              '47011 Valladolid,Span',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14.px,
                                  ),
                            ),
                            trailing: Text(
                              'Edit',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.4.px),
                            thickness: .6,
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            '46100, Burjassot',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 20.px),
                          ),
                          SizedBox(height: 20.px),
                          CommonWidgets.appIcons(
                            assetName: 'assets/un_used_images/map.png',
                            height: 100.px,
                            width: double.infinity,
                            borderRadius: 8.px,
                          ),
                          SizedBox(height: 20.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () =>
                                controller.clickOnSellFasterButton(),
                            childText: Text(
                              StringConstants.sellFaster.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 20.px),
                        ],
                      ),
                    )
                  ],
                )
              : controller.getProductDetailsModel == null
                  ? const SizedBox()
                  : CommonWidgets.dataNotFound(),
        ),
      );
    });
  }
}
