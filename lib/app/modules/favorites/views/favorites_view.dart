import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_favorite_product_model.dart';
import '../../../data/apis/api_models/get_like_users_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return SafeArea(
        child: DefaultTabController(
          initialIndex: 1,
          length: 4,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants.favorites.tr,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 24.px, color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 30.px),
                  CommonWidgets.commonTextField(
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
                      splashBorderRadius: BorderRadius.circular(8.px),
                      controller: controller.tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.px),
                        color: Theme.of(context).primaryColor,
                      ),
                      labelColor: Theme.of(context).scaffoldBackgroundColor,
                      unselectedLabelColor:
                          Theme.of(context).textTheme.displayMedium?.color,
                      tabs: controller.tabs,
                      labelStyle:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                      indicatorSize:
                          TabBarIndicatorSize.tab, // Set indicatorSize to tab
                    ),
                  ),
                  SizedBox(height: 20.px),
                  Obx(() {
                    controller.inAsyncCall.value;
                    return controller.inAsyncCall.value
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(child: screens());
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget screens() {
    switch (controller.tabController.index) {
      case 0:
        return const ProductsView();
      case 1:
        return const SearchesView();
      case 2:
        return const FavoritesProfileView();
      default:
        return const FriendView();
    }
  }
}

class ProductsView extends GetView<FavoritesController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: controller.getFavoriteProductList.isNotEmpty
            ? Wrap(
                children: List.generate(
                    controller.getFavoriteProductList.length, (index) {
                  GetFavoriteProductData item =
                      controller.getFavoriteProductList[index];
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
                                        '${CommonMethods.cur}${item.product!.price}',
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
                                  item.product!.title!,
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
                                  item.product!.productName!,
                                  maxLines: 2,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(height: 5.px),
                                Text(
                                  item.product!.productLocation ?? 'Address',
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

class SearchesView extends GetView<FavoritesController> {
  const SearchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (context, index) => Card(
        elevation: .2.px,
        child: ListTile(
          // contentPadding: EdgeInsets.zero,
          title: Text(
            'gratis',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 20.px),
          ),
          subtitle: Text(
            'Home & Garden. WC2R 2...',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px,
                ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30.px,
                width: 30.px,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(.1.px),
                  borderRadius: BorderRadius.circular(6.px),
                ),
                child: Center(
                  child: Icon(
                    Icons.highlight_remove_rounded,
                    color: Theme.of(context).colorScheme.error,
                    size: 16.px,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesProfileView extends GetView<FavoritesController> {
  const FavoritesProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.getLikeUserList.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.getLikeUserList.length,
            itemBuilder: (context, index) {
              GetLikeUsersData item = controller.getLikeUserList[index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.px)),
                elevation: .2.px,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.px),
                            topLeft: Radius.circular(10.px),
                          ),
                        ),
                        child:
                            /*Row(children: [
                    Expanded(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CommonWidgets.appIcons(
                                  assetName: 'assets/un_used_images/collage2.png',
                                  height: 110.px,
                                  borderRadius: 0,
                                  width: double.infinity,
                                  fit: BoxFit.cover),
                              Padding(
                                padding: EdgeInsets.all(8.px),
                                child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icMoneyReceived,
                                  width: 40.px,
                                  height: 40.px,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CommonWidgets.appIcons(
                                assetName: 'assets/un_used_images/collage3.png',
                                height: 110.px,
                                borderRadius: 0,
                                width: double.infinity,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.px),
                                child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icSaving,
                                  width: 40.px,
                                  height: 40.px,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CommonWidgets.appIcons(
                            assetName: 'assets/un_used_images/collage1.png',
                            height: 220.px,
                            borderRadius: 0,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.px),
                            child: CommonWidgets.appIcons(
                              assetName: IconConstants.icHands,
                              width: 40.px,
                              height: 40.px,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),*/
                            Stack(
                          children: [
                            CommonWidgets.imageView(
                              height: 220.px,
                              image: item.product!.productImage ?? '',
                            ),
                            Positioned(
                              top: 5.px,
                              right: 5.px,
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icHands,
                                  width: 40.px,
                                  height: 40.px,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5.px,
                              left: 10.px,
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icMoneyReceived,
                                  width: 40.px,
                                  height: 40.px,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icSaving,
                                  width: 40.px,
                                  height: 40.px,
                                ),
                              ),
                            )
                          ],
                        )),
                    SizedBox(height: 8.px),
                    ListTile(
                      leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icUserImage,
                        height: 50.px,
                        width: 50.px,
                        borderRadius: 0.px,
                      ),
                      trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icLikePrimary,
                      ),
                      title: Text(
                        item.product!.userName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                      subtitle: Text(
                        '4.5 (${item.product!.reviewCount} reviews)',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : CommonWidgets.dataNotFound();
  }
}

class FriendView extends GetView<FavoritesController> {
  const FriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (context, index) => Card(
        elevation: .2.px,
        child: ListTile(
          // contentPadding: EdgeInsets.zero,
          title: Text(
            'Jordyn Dokidis',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 20.px),
          ),
          subtitle: Text(
            '01-29-2024',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px,
                ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonWidgets.commonElevatedButton(
                wantContentSizeButton: true,
                decoration: const BoxDecoration(),
                onPressed: () {},
                borderRadius: 4.px,
                contentPadding: EdgeInsets.zero,
                height: 24.px,
                childText: Text(
                  'Done',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 10.px,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
