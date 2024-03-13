import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringConstants.welcome.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 24.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(height: 8.px),
                              if (controller.userData != null &&
                                  controller.userData!.userName != null &&
                                  controller.userData!.userName!.isNotEmpty)
                                Text(
                                  controller.userData!.userName ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 20.px,
                                        color: Theme.of(Get.context!)
                                            .textTheme
                                            .headlineMedium
                                            ?.color
                                            ?.withOpacity(.6),
                                      ),
                                ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        CommonWidgets.appIcons(
                            assetName: IconConstants.icCart,
                            height: 28.px,
                            width: 28.px,
                            borderRadius: 24.px),
                        SizedBox(width: 10.px),
                        (controller.userData != null &&
                                controller.userData!.image != null &&
                                controller.userData!.image!.isNotEmpty)
                            ? CommonWidgets.imageView(
                                image: controller.userData!.image ?? '',
                                height: 48.px,
                                width: 48.px,
                                borderRadius: BorderRadius.circular(24.px),
                              )
                            : CommonWidgets.appIcons(
                                assetName: IconConstants.icUserImage,
                                height: 48.px,
                                width: 48.px,
                                borderRadius: 24.px),
                      ],
                    ),
                    SizedBox(height: 30.px),
                    CommonWidgets.commonTextField(
                      readOnly: true,
                      onTap: () => controller.clickOnSearchTextField(),
                      /* onChanged: (value) =>
                          controller.searchMethod(value: value),*/
                      // controller: controller.searchController,
                      hintText: StringConstants.search.tr,
                      borderRadius: 24.px,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icSearch,
                            height: 20.px,
                            width: 20.px,
                          ),
                        ],
                      ),
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icCameraNavBar,
                            height: 40.px,
                            width: 40.px,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.px),
                    if (controller.bannerData.isNotEmpty)
                      CarouselSlider(
                        items: List.generate(
                          controller.bannerData.length,
                          (index) => Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Stack(
                                children: [
                                  CommonWidgets.imageView(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.px),
                                      ),
                                      width: double.infinity,
                                      height: 160.px,
                                      image:
                                          controller.bannerData[index].image ??
                                              ''),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.px,
                                      horizontal: 16.px,
                                    ),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Spacer(),
                                          if (controller.bannerData[index]
                                                      .discount !=
                                                  null &&
                                              controller.bannerData[index]
                                                  .discount!.isNotEmpty)
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.px),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer
                                                    .withOpacity(.2),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.px),
                                                child: Text(
                                                  '${controller.bannerData[index].discount}% OFF',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 10.px,
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          if (controller.bannerData[index]
                                                      .discount !=
                                                  null &&
                                              controller.bannerData[index]
                                                  .discount!.isNotEmpty)
                                            SizedBox(height: 8.px),
                                          if (controller
                                                      .bannerData[index].item !=
                                                  null &&
                                              controller.bannerData[index].item!
                                                  .isNotEmpty)
                                            Text(
                                              controller
                                                      .bannerData[index].item ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                  ),
                                            ),
                                          if (controller
                                                      .bannerData[index].item !=
                                                  null &&
                                              controller.bannerData[index].item!
                                                  .isNotEmpty)
                                            SizedBox(height: 4.px),
                                          if (controller.bannerData[index]
                                                      .title !=
                                                  null &&
                                              controller.bannerData[index]
                                                  .title!.isNotEmpty)
                                            Text(
                                              controller.bannerData[index]
                                                      .title ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 24.px,
                                                    color: Theme.of(
                                                            Get.context!)
                                                        .scaffoldBackgroundColor,
                                                  ),
                                            ),
                                        ]),
                                  ),
                                ],
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
                                      .withOpacity(.4.px),
                                  borderRadius: BorderRadius.circular(12.px),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Wrap(
                                      children: List.generate(
                                        controller.bannerData.length,
                                        (index) => Padding(
                                          padding: EdgeInsets.all(2.px),
                                          child: Center(
                                            child: Container(
                                              width: 6.px,
                                              height: 6.px,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.px),
                                                color:
                                                    controller.cardIndex
                                                                .value ==
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        options: CarouselOptions(
                          height: 160.px,
                          onPageChanged: (index, reason) {
                            controller.cardIndex.value = index;
                          },
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1200),
                          autoPlayCurve: Curves.easeIn,
                          scrollDirection: Axis.horizontal,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                        ),
                      ),
                    SizedBox(height: 20.px),
                    if (controller.data.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringConstants.categories.tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 18.px),
                          ),
                          InkWell(
                            onTap: () => controller.seeAll(),
                            borderRadius: BorderRadius.circular(8.px),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Text(
                                StringConstants.seeAll.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      color:
                                          Theme.of(Get.context!).primaryColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (controller.data.isNotEmpty) SizedBox(height: 20.px),
                    if (controller.data.isNotEmpty)
                      SingleChildScrollView(
                        child: Wrap(
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width / 4.4.px,
                              child: InkWell(
                                onTap: () => controller.clickOnCategoryCard(
                                    index: index),
                                borderRadius: BorderRadius.circular(8.px),
                                child: Container(
                                  // height: 100.px,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.px),
                                    border: Border.all(
                                      width: .4.px,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 65.px,
                                        height: 65.px,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer
                                              .withOpacity(.4.px),
                                          borderRadius:
                                              BorderRadius.circular(34.px),
                                        ),
                                        child: Center(
                                          child: CommonWidgets.imageView(
                                            image:
                                                controller.data[index].image ??
                                                    '',
                                            width: 28.px,
                                            height: 28.px,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 14.px),
                                      if (controller.data[index].categoryName !=
                                              null &&
                                          controller.data[index].categoryName!
                                              .isNotEmpty)
                                        Text(
                                          controller.data[index].categoryName ??
                                              '',
                                          maxLines: 1,
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
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    if (controller.data.isNotEmpty) SizedBox(height: 20.px),
                    if (controller.data.isNotEmpty)
                      CommonWidgets.commonElevatedButton(
                        onPressed: () {},
                        childText: Text(
                          StringConstants.placeAnAdHere.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    SizedBox(height: 20.px),
                    if (controller.data.isNotEmpty)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          StringConstants.all.tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 18.px),
                        ),
                      ),
                    if (controller.allProductData.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.allProductData.isNotEmpty)
                      controller.searchResult.isNotEmpty ||
                              controller.searchController.text.isNotEmpty
                          ? SingleChildScrollView(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: List.generate(
                                      controller.searchResult.length, (index) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      // height: 280.px,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.px),
                                        child: InkWell(
                                          onTap: () => controller.clickOnCard(
                                              index: index),
                                          borderRadius:
                                              BorderRadius.circular(14.px),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  CommonWidgets.imageView(
                                                    image: controller
                                                            .searchResult[index]
                                                            .image ??
                                                        '',
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.px),
                                                    height: 140.px,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(4.px),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CommonWidgets.appIcons(
                                                          assetName: controller
                                                                  .listOfCards2[
                                                              0]['icon1'],
                                                          width: 40.px,
                                                          height: 40.px,
                                                        ),
                                                        CommonWidgets.appIcons(
                                                          assetName: controller
                                                                  .listOfCards2[
                                                              0]['icon2'],
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
                                                                  .searchResult[
                                                                      index]
                                                                  .price ??
                                                              '',
                                                          maxLines: 1,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayMedium
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        16.px,
                                                                    color: Theme.of(
                                                                            context)
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
                                                    controller
                                                            .searchResult[index]
                                                            .title ??
                                                        '',
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 14.px),
                                                  ),
                                                  SizedBox(height: 10.px),
                                                  Text(
                                                    controller
                                                            .searchResult[index]
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
                            )
                          : SingleChildScrollView(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: List.generate(
                                      controller.allProductData.length,
                                      (index) {
                                    return SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      // height: 280.px,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.px),
                                        child: InkWell(
                                          onTap: () => controller.clickOnCard(
                                              index: index),
                                          borderRadius:
                                              BorderRadius.circular(14.px),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  CommonWidgets.imageView(
                                                    image: controller
                                                            .allProductData[
                                                                index]
                                                            .image ??
                                                        '',
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.px),
                                                    height: 140.px,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(4.px),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CommonWidgets.appIcons(
                                                          assetName: controller
                                                                  .listOfCards2[
                                                              0]['icon1'],
                                                          width: 40.px,
                                                          height: 40.px,
                                                        ),
                                                        CommonWidgets.appIcons(
                                                          assetName: controller
                                                                  .listOfCards2[
                                                              0]['icon2'],
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
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayMedium
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        16.px,
                                                                    color: Theme.of(
                                                                            context)
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
                                                    controller
                                                            .allProductData[
                                                                index]
                                                            .title ??
                                                        '',
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 14.px),
                                                  ),
                                                  SizedBox(height: 10.px),
                                                  Text(
                                                    controller
                                                            .allProductData[
                                                                index]
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
}
