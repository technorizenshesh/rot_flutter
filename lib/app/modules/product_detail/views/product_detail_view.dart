import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/read_more.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);

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
                              padding: EdgeInsets.all(20.px),
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
                                  SizedBox(width: 10.px),
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
                                          assetName: IconConstants.icCart,
                                          height: 24.px,
                                          width: 24.px,
                                          borderRadius: 24.px),
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
                              if (controller.data!.productLikeUnlike != null)
                                GestureDetector(
                                  onTap: () => controller.clickOnLikeButton(),
                                  child: Icon(
                                    (StringConstants.unlike ==
                                            controller.data!.productLikeUnlike)
                                        ? Icons.favorite_border_rounded
                                        : Icons.favorite_rounded,
                                    size: 24,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                            ],
                          ),
                          SizedBox(height: 20.px),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  controller.data!.dateTime ?? '',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                                    SizedBox(width: 10.px),
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
                              CommonWidgets.commonElevatedButton(
                                decoration: const BoxDecoration(),
                                wantContentSizeButton: true,
                                // width: 100.px,
                                height: 44.px,
                                borderRadius: 22.px,
                                onPressed: () => controller.clickOnChat(),
                                childText: Row(
                                  children: [
                                    Text(
                                      StringConstants.chat.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: 10.px),
                                    CommonWidgets.appIcons(
                                      assetName: IconConstants.icSms,
                                      height: 24.px,
                                      width: 24.px,
                                      borderRadius: 0.px,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.px),
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.px),
                            ),
                            onTap: () => controller.clickOnUserProfileTile(),
                            leading: CommonWidgets.appIcons(
                              assetName: IconConstants.icUserImage,
                              height: 50.px,
                              width: 50.px,
                              borderRadius: 0.px,
                            ),
                            title: Text(
                              'iphone gadgets',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontSize: 18.px),
                            ),
                            subtitle: Text(
                              '⭐⭐⭐⭐⭐ 5 (2,495 reviews)',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  'Delivery in 3-7 days',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 20.px),
                                ),
                              ),
                              SizedBox(width: 10.px),
                              CommonWidgets.appIcons(
                                assetName: IconConstants.icInfo,
                                height: 24.px,
                                width: 24.px,
                                borderRadius: 0.px,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.px),
                          ListTile(
                            leading: CommonWidgets.appIcons(
                              assetName: IconConstants.icAddressPin,
                              height: 44.px,
                              width: 44.px,
                              borderRadius: 0.px,
                            ),
                            title: Text(
                              'At collection point from €2.99',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 20.px),
                            ),
                            subtitle: Text(
                              'See nearby points',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14.px,
                                  ),
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
                              height: 44.px,
                              width: 44.px,
                              borderRadius: 0.px,
                            ),
                            title: Text(
                              'At my address from €3.49',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 20.px),
                            ),
                            subtitle: Text(
                              'Send to 47011 Valladolid',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14.px,
                                  ),
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
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CommonWidgets.appIcons(
                                        assetName:
                                            IconConstants.icRotProtection,
                                      ),
                                      SizedBox(width: 10.px),
                                      Text(
                                        StringConstants.rotProtection.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '+ Info',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 14.px,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.px),
                                  Text(
                                    StringConstants.buyWithoutWorries.tr,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Buy at ${CommonMethods.cur}186.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 20.px),
                                  ),
                                  SizedBox(height: 10.px),
                                  Text(
                                    'Original G084SN05 V.8 AUO Screen 8.4 800',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 10.px),
                                  Text(
                                    'Original AUO 8.4 800X600 LCD in Stock & 1 Year Warranty displaysscreen.com',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 10.px),
                                  CommonWidgets.commonElevatedButton(
                                    onPressed: () =>
                                        controller.clickOnLearnMoreButton(),
                                    childText: Text(
                                      StringConstants.learnMore.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(height: 20.px),
                                ],
                              ),
                            ),
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
                          Text(
                            StringConstants.keepExploring.tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 20.px),
                          ),
                          SizedBox(height: 10.px),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.px),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Text(
                                'Other computer accessories',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.px),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.px),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Text(
                                'Computer accessories',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          Center(
                            child: InkWell(
                              onTap: () => controller.clickOnReportProduct(),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: Text(
                                  StringConstants.reportProduct.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 16.px,
                                        color:
                                            Theme.of(Get.context!).primaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () => controller.clickOnBuyButton(),
                            childText: Text(
                              StringConstants.buy.tr,
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
