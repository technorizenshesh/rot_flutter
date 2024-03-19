import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_models/get_review_model.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_profile_public_products_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_public_controller.dart';

class ProfilePublicView extends GetView<ProfilePublicController> {
  const ProfilePublicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return SafeArea(
        child: DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Scaffold(
              appBar:
                  CommonWidgets.appBar(title: StringConstants.profilePublic),
              body: Obx(() {
                controller.inAsyncCall.value;
                return controller.inAsyncCall.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px),
                        child: controller.getProfilePublicData == null
                            ? CommonWidgets.dataNotFound()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.px),
                                  Card(
                                    elevation: .4.px,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.px),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            /*  leading: CommonWidgets.appIcons(
                                              assetName:
                                                  IconConstants.icUserImage,
                                              height: 50.px,
                                              width: 50.px,
                                              borderRadius: 0.px,
                                            ),*/
                                            leading: CommonWidgets.imageView(
                                              height: 50.px,
                                              width: 50.px,
                                              radius: 25.px,
                                              image: controller
                                                      .getProfilePublicData!
                                                      .image ??
                                                  '',
                                            ),
                                            trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CommonWidgets.appIcons(
                                                    assetName:
                                                        IconConstants.icShare,
                                                    height: 28.px,
                                                    width: 28.px,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius: 0.px,
                                                  ),
                                                  SizedBox(width: 8.px),
                                                  Obx(() {
                                                    controller.likeUnlike.value;
                                                    return GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .userLikeUnlikeApi();
                                                      },
                                                      child: CommonWidgets.appIcons(
                                                          assetName:
                                                              IconConstants
                                                                  .icLikePrimary,
                                                          height: 28.px,
                                                          width: 28.px,
                                                          borderRadius: 0.px,
                                                          color: controller
                                                                  .likeUnlike
                                                                  .value
                                                              ? Colors.redAccent
                                                              : Colors.teal),
                                                    );
                                                  })
                                                ]),
                                            title: Text(
                                              controller.getProfilePublicData!
                                                      .userName ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(fontSize: 18.px),
                                            ),
                                            subtitle: Text(
                                              '⭐⭐⭐⭐⭐ 5 (${controller.getProfilePublicData!.reviewCount} reviews)',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(fontSize: 10.px),
                                            ),
                                          ),
                                          SizedBox(height: 14.px),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CommonWidgets.appIcons(
                                                    assetName:
                                                        IconConstants.icSale,
                                                    width: 24.px,
                                                    height: 24.px,
                                                  ),
                                                  SizedBox(width: 12.px),
                                                  Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: '326',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineMedium
                                                              ?.copyWith(
                                                                fontSize: 12.px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: ' Sales',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineMedium
                                                              ?.copyWith(
                                                                  fontSize:
                                                                      10.px),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '61',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium
                                                          ?.copyWith(
                                                              fontSize: 12.px,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    TextSpan(
                                                      text: ' Purchases',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium
                                                          ?.copyWith(
                                                              fontSize: 10.px),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(),
                                            ],
                                          ),
                                          SizedBox(height: 14.px),
                                          Row(
                                            children: [
                                              CommonWidgets.appIcons(
                                                assetName:
                                                    IconConstants.icShipments,
                                                width: 24.px,
                                                height: 24.px,
                                              ),
                                              SizedBox(width: 12.px),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '24',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium
                                                          ?.copyWith(
                                                              fontSize: 12.px,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    TextSpan(
                                                      text: ' Shipments',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium
                                                          ?.copyWith(
                                                              fontSize: 10.px),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 14.px),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CommonWidgets.appIcons(
                                                    assetName: IconConstants
                                                        .icLocation,
                                                    width: 24.px,
                                                    height: 24.px,
                                                  ),
                                                  SizedBox(width: 12.px),
                                                  Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: controller
                                                                  .getProfilePublicData!
                                                                  .sellerAddress ??
                                                              '',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineMedium
                                                              ?.copyWith(
                                                                  fontSize:
                                                                      10.px),
                                                        ),
                                                        TextSpan(
                                                          text: 'View location',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineMedium
                                                              ?.copyWith(
                                                                fontSize: 12.px,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.openRateUs();
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 24.px,
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                    SizedBox(width: 8.px),
                                                    Text(
                                                      'Rate Us',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium
                                                          ?.copyWith(
                                                            fontSize: 12.px,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                    ),
                                                    SizedBox(width: 10.px),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.px),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                          .withOpacity(.1.px),
                                      borderRadius: BorderRadius.circular(8.px),
                                    ),
                                    child: TabBar(
                                      onTap: (value) {
                                        controller.increment();
                                      },
                                      splashBorderRadius:
                                          BorderRadius.circular(8.px),
                                      controller: controller.tabController,
                                      indicator: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      labelColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      unselectedLabelColor: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.color,
                                      tabs: [
                                        Tab(
                                            text: controller.products.isNotEmpty
                                                ? "${controller.products.length} ${StringConstants.published}"
                                                : "0 ${StringConstants.published}"),
                                        Tab(
                                            text:
                                                "${controller.getProfilePublicData!.reviewCount} ${StringConstants.reviews}"),
                                        const Tab(
                                            text: "+ ${StringConstants.info}"),
                                      ],
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 14.px,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                      indicatorSize: TabBarIndicatorSize
                                          .tab, // Set indicatorSize to tab
                                    ),
                                  ),
                                  SizedBox(height: 20.px),
                                  Obx(() {
                                    controller.count.value;
                                    return Expanded(
                                      child: screens(),
                                    );
                                  }),
                                ],
                              ),
                      );
              })),
        ),
      );
    });
  }

  Widget screens() {
    switch (controller.tabController.index) {
      case 0:
        return const PublishedView();
      case 1:
        return const ReviewsView();
      default:
        return const InfoView();
    }
  }
}

class PublishedView extends GetView<ProfilePublicController> {
  const PublishedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: controller.products.isNotEmpty
            ? Wrap(
                children: List.generate(controller.products.length, (index) {
                  ProfilePublicProductsData item = controller.products[index];
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 280.px,
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
                                  borderRadius: BorderRadius.circular(8.px),
                                  child: CommonWidgets.imageView(
                                    height: 170.px,
                                    image: item.productImage!.isNotEmpty
                                        ? item.productImage![0].image ?? ""
                                        : '',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.px),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonWidgets.appIcons(
                                        assetName: controller.listOfCards[index]
                                            ['icon1'],
                                        width: 40.px,
                                        height: 40.px,
                                      ),
                                      CommonWidgets.appIcons(
                                        assetName: controller.listOfCards[index]
                                            ['icon2'],
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.px),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${CommonMethods.cur}${item.price}',
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
                                      assetName: IconConstants.icLikePrimary,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.px),
                                Text(
                                  item.title!,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                                SizedBox(height: 5.px),
                                Text(
                                  item.productName!,
                                  maxLines: 1,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 5.px),
                                Text(
                                  item.productLocation ?? 'Address',
                                  maxLines: 1,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )
            : CommonWidgets.dataNotFound());
  }
}

class ReviewsView extends GetView<ProfilePublicController> {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.reviewList.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 4.px),
            itemCount: controller.reviewList.length,
            itemBuilder: (context, index) {
              ReviewData item = controller.reviewList[index];
              return Card(
                elevation: .2.px,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      // contentPadding: EdgeInsets.zero,
                      leading: CommonWidgets.imageView(
                        image: item.image ?? '',
                        height: 60.px,
                        width: 60.px,
                        radius: 4.px,
                      ),
                      title: Text(
                        item.userName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1.px,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.px, vertical: 4.px),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              '${item.rating} ⭐',
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.px),
                    Padding(
                      padding: EdgeInsets.all(8.px),
                      child: Text(
                        item.review ?? '',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(height: 10.px),
                  ],
                ),
              );
            })
        : CommonWidgets.dataNotFound();
  }
}

class InfoView extends GetView<ProfilePublicController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Verified information',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 16.px),
        ),
        SizedBox(height: 10.px),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CommonWidgets.appIcons(
                assetName: IconConstants.icEmail,
                height: 40.px,
                width: 40.px,
                borderRadius: 20.px,
              ),
              title: Text(
                'Email',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 12.px),
              ),
              subtitle: Text(
                controller.getProfilePublicData!.email ?? 'user@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CommonWidgets.appIcons(
                assetName: IconConstants.icPhone,
                height: 40.px,
                width: 40.px,
                borderRadius: 20.px,
              ),
              title: Text(
                'Mobile',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 12.px),
              ),
              subtitle: Text(
                controller.getProfilePublicData!.mobile ?? '+123456789',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CommonWidgets.appIcons(
                assetName: IconConstants.icPhone,
                height: 40.px,
                width: 40.px,
                borderRadius: 20.px,
              ),
              title: Text(
                'Whatsapp Number',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 12.px),
              ),
              subtitle: Text(
                controller.getProfilePublicData!.whatsappNumber ?? '+123456789',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.px),
        Text(
          'Member since',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 14.px, color: Theme.of(context).primaryColor),
        ),
        SizedBox(height: 10.px),
        Text(
          controller.getProfilePublicData!.createdAt!.substring(0, 10) ?? '',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 14.px, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20.px),
        Text(
          'Response rate',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 14.px, color: Theme.of(context).primaryColor),
        ),
        SizedBox(height: 10.px),
        Text(
          'Typically responds within 3 hours',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 14.px, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20.px),
        Text(
          'Location',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 14.px, color: Theme.of(context).primaryColor),
        ),
        SizedBox(height: 10.px),
        CommonWidgets.appIcons(
          assetName: 'assets/un_used_images/map.png',
          height: 100.px,
          width: double.infinity,
          borderRadius: 8.px,
        ),
        SizedBox(height: 20.px),
      ],
    );
  }
}
