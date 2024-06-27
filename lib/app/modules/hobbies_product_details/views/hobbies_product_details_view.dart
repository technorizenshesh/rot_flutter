import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/read_more.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/hobbies_product_details_controller.dart';

class HobbiesProductDetailsView
    extends GetView<HobbiesProductDetailsController> {
  const HobbiesProductDetailsView({Key? key}) : super(key: key);
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
                                                            5.px),
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
                                  controller.data!.title ?? '',
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
                                        controller.getRandomView().toString(),
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
                                        controller.getProductDetailsModel!.data!
                                                .productLikeUnlikeCount
                                                .toString() ??
                                            '0',
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
                                        controller.data!.price!.isNotEmpty)
                                      Flexible(
                                        child: Text(
                                          '${CommonMethods.cur} ${controller.data!.price.toString()}/${controller.data!.modelName.toString()}',
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
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.px),
                            ),
                            margin: EdgeInsets.zero,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.px),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 6.px, vertical: 2.px),
                              onTap: () => controller.clickOnUserProfileTile(),
                              leading: CommonWidgets.imageView(
                                image: controller.getProfilePublicData!.image ??
                                    '',
                                height: 50.px,
                                width: 50.px,
                                radius: 25.px,
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      controller
                                              .getProfilePublicData!.userName ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(fontSize: 18.px),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.px,
                                    child: CountryFlag.fromCountryCode(
                                      controller.getProfilePublicData!
                                              .countryCode ??
                                          '',
                                      height: 20.px,
                                      width: 25.px,
                                      borderRadius: 3,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                '⭐⭐⭐⭐⭐ 5 (${controller.getProfilePublicData!.reviewCount} reviews)',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          ReadMoreText(
                            removeHtmlTags(controller.data!.description ?? ''),
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
                          productDetails(context),
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
                                    InkWell(
                                      onTap: () {
                                        controller.clickOnLearnMoreButton();
                                      },
                                      child: Text(
                                        'More information',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              decorationColor: Theme.of(context)
                                                  .primaryColor,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 14.px,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
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
                                      InkWell(
                                        onTap: () {
                                          controller.clickOnLearnMoreButton();
                                        },
                                        child: Text(
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
                          Row(
                            children: [
                              CommonWidgets.appIcons(
                                  assetName: IconConstants.icLocation,
                                  height: 25.px,
                                  width: 25.px),
                              Flexible(
                                child: Text(
                                  '${controller.getProductDetailsModel!.data!.zipCode ?? ''},${controller.getProductDetailsModel!.data!.productLocation}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 16.px),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.px),
                          Container(
                            height: 150.px,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px)),
                            clipBehavior: Clip.hardEdge,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              zoomGesturesEnabled: false,
                              tiltGesturesEnabled: false,
                              onCameraMove: (CameraPosition cameraPosition) {
                                print(cameraPosition.zoom);
                              },
                              minMaxZoomPreference:
                                  MinMaxZoomPreference(13, 17),
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    controller.lat.value, controller.lon.value),
                                zoom: 14.4746,
                              ),
                              onMapCreated:
                                  (GoogleMapController googlecontroller) {
                                controller.mapController
                                    .complete(googlecontroller);
                              },
                            ),
                          ),
                          SizedBox(height: 20.px),
                          //Report Product...
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
                            onPressed: () => controller.clickOnChat(),
                            childText: Text(
                              StringConstants.chatWithProvider.tr,
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

  static String removeHtmlTags(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  Widget productDetails(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.getProductDetailsModel!.data!.color != '')
            Padding(
              padding: EdgeInsets.only(top: 5.px),
              child: Text(
                  '* ${StringConstants.colour} ${controller.getProductDetailsModel!.data!.color}',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          if (controller.getProductDetailsModel!.data!.modelName != '')
            Padding(
              padding: EdgeInsets.only(top: 5.px),
              child: Text(
                '* ${StringConstants.time}: ${controller.getProductDetailsModel!.data!.modelName}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          if (controller.getProductDetailsModel!.data!.shipping != '')
            Padding(
              padding: EdgeInsets.only(top: 5.px),
              child: Text(
                  '* ${StringConstants.shipping}: ${controller.getProductDetailsModel!.data!.shipping}',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          if (controller.getProductDetailsModel!.data!.partNumber != '')
            Padding(
              padding: EdgeInsets.only(top: 5.px),
              child: Text(
                  '* ${StringConstants.partNumber}: ${controller.getProductDetailsModel!.data!.partNumber}',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          if (controller.getProductDetailsModel!.data!.registrationYear != '')
            Padding(
              padding: EdgeInsets.only(top: 5.px),
              child: Text(
                  '* ${StringConstants.iCanMove}: ${controller.getProductDetailsModel!.data!.registrationYear}',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          Padding(
            padding: EdgeInsets.only(top: 5.px),
            child: Text(
                '* Product Status: ${controller.getProductDetailsModel!.data!.availableAt}',
                style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}
