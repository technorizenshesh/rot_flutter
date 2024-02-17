import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
        body: ListView(
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
                              StringConstants.welcome,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 24.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(height: 8.px),
                            Text(
                              'Johan Smiths',
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
                      CommonWidgets.appIcons(
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
                    hintText: StringConstants.search,
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
                  CarouselSlider(
                    items: List.generate(
                      6,
                      (index) => Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.px),
                              ),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/un_used_images/image_head _phones.png',
                                ),
                              ),
                              border: Border.all(
                                width: .4.px,
                                color: Theme.of(Get.context!)
                                    .scaffoldBackgroundColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.px,
                                horizontal: 16.px,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
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
                                          '30% OFF',
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
                                    SizedBox(height: 8.px),
                                    Text(
                                      'On Headphones',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                    SizedBox(height: 4.px),
                                    Text(
                                      'Exclusive Sales',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 24.px,
                                            color: Theme.of(Get.context!)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ]),
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
                                  .withOpacity(.4.px),
                              borderRadius: BorderRadius.circular(12.px),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Wrap(
                                  children: List.generate(
                                    6,
                                    (index) => Padding(
                                      padding: EdgeInsets.all(2.px),
                                      child: Center(
                                        child: Container(
                                          width: 6.px,
                                          height: 6.px,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.px),
                                            color: controller.cardIndex.value ==
                                                    index
                                                ? Theme.of(context).primaryColor
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.categories,
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
                            StringConstants.seeAll,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 12.px,
                                  color: Theme.of(Get.context!).primaryColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px),
                  SingleChildScrollView(
                    child: Wrap(
                      children: List.generate(controller.list.length, (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: InkWell(
                            onTap: () => controller.clickOnCard(index: index),
                            borderRadius: BorderRadius.circular(8.px),
                            child: Container(
                              // height: 100.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.px),
                                border: Border.all(
                                  width: .4.px,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 65.px,
                                    height: 65.px,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(.4.px),
                                      borderRadius:
                                          BorderRadius.circular(34.px),
                                    ),
                                    child: Center(
                                      child: CommonWidgets.appIcons(
                                        assetName: controller.list[index]['icon'],
                                        width: 28.px,
                                        height: 28.px,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14.px),
                                  Text(
                                    controller.list[index]['title'],
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context).primaryColor,
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
                  SizedBox(height: 20.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () {},
                    childText: Text(
                      StringConstants.placeAnAdHere,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringConstants.electronics,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  SingleChildScrollView(
                    child: Wrap(
                      children:
                          List.generate(controller.listOfCards.length, (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          // height: 280.px,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.px),
                            child: InkWell(
                              onTap: () => controller.clickOnCard(index: index),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                        child: Image.asset(
                                          controller.listOfCards[index]
                                              ['image'],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.px),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonWidgets.appIcons(
                                              assetName: controller
                                                  .listOfCards[index]['icon1'],
                                              width: 40.px,
                                              height: 40.px,
                                            ),
                                            CommonWidgets.appIcons(
                                              assetName: controller
                                                  .listOfCards[index]['icon2'],
                                              width: 40.px,
                                              height: 40.px,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              controller.listOfCards[index]
                                                  ['price'],
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
                                        controller.listOfCards[index]['title'],
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 14.px,
                                            ),
                                      ),
                                      SizedBox(height: 10.px),
                                      Text(
                                        controller.listOfCards[index]
                                            ['subTitle'],
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
                  SizedBox(height: 20.px),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringConstants.nearYou,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  SingleChildScrollView(
                    child: Wrap(
                      children: List.generate(controller.listOfCards2.length,
                          (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          // height: 280.px,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.px),
                            child: InkWell(
                              onTap: () => controller.clickOnCard(index: index),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                        child: Image.asset(
                                          controller.listOfCards2[index]
                                              ['image'],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.px),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonWidgets.appIcons(
                                              assetName: controller
                                                  .listOfCards2[index]['icon1'],
                                              width: 40.px,
                                              height: 40.px,
                                            ),
                                            CommonWidgets.appIcons(
                                              assetName: controller
                                                  .listOfCards2[index]['icon2'],
                                              width: 40.px,
                                              height: 40.px,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              controller.listOfCards2[index]
                                                  ['price'],
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
                                        controller.listOfCards2[index]['title'],
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 14.px,
                                            ),
                                      ),
                                      SizedBox(height: 10.px),
                                      Text(
                                        controller.listOfCards2[index]
                                            ['subTitle'],
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
                  SizedBox(height: 20.px),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringConstants.bestSeller,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  SingleChildScrollView(
                    child: Wrap(
                      children: List.generate(controller.listOfCards3.length,
                          (index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          // height: 280.px,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.px),
                            child: InkWell(
                              onTap: () => controller.clickOnCard(index: index),
                              borderRadius: BorderRadius.circular(8.px),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                        child: Image.asset(
                                          controller.listOfCards3[index]
                                              ['image'],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.px),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonWidgets.appIcons(
                                              assetName: controller
                                                  .listOfCards3[index]['icon1'],
                                              width: 40.px,
                                              height: 40.px,
                                            ),
                                            CommonWidgets.appIcons(
                                              assetName: controller
                                                  .listOfCards3[index]['icon2'],
                                              width: 40.px,
                                              height: 40.px,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              controller.listOfCards3[index]
                                                  ['price'],
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
                                        controller.listOfCards3[index]['title'],
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 14.px,
                                            ),
                                      ),
                                      SizedBox(height: 10.px),
                                      Text(
                                        controller.listOfCards3[index]
                                            ['subTitle'],
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
                  SizedBox(height: 20.px),
                ],
              ),
            ),
            SizedBox(height: 12.px),
          ],
        ),
      );
    });
  }
}
