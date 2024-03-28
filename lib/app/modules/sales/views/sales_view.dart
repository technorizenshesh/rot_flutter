import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_product_delivery_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sales_controller.dart';

class SalesView extends GetView<SalesController> {
  const SalesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return SafeArea(
        child: DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Scaffold(
            appBar: CommonWidgets.appBar(title: StringConstants.sales.tr),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    controller.count.value;
                    return controller.showProgressBar.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
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
        return const InWindView();
      case 1:
        return const InProgressView();
      default:
        return const FinishedView();
    }
  }
}

class InWindView extends GetView<SalesController> {
  const InWindView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.inWindProductList.isNotEmpty
        ? SingleChildScrollView(
            child: Wrap(
              children:
                  List.generate(controller.inWindProductList.length, (index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 280.px,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.px),
                    child: InkWell(
                      onTap: () => controller.clickOnCard(
                          productId: controller.inWindProductList[index].id
                              .toString()),
                      borderRadius: BorderRadius.circular(8.px),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.px),
                                child: CommonWidgets.imageView(
                                    image: controller.inWindProductList[index]
                                            .productImage!.isNotEmpty
                                        ? controller.inWindProductList[index]
                                                .productImage![0].image ??
                                            ''
                                        : '',
                                    width: 180.px,
                                    height: 170.px),
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
                                      controller
                                              .inWindProductList[index].price ??
                                          '',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                  ),
                                  CommonWidgets.appIcons(
                                    assetName: IconConstants.icLikePrimary,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.px),
                              Text(
                                controller.inWindProductList[index].title ?? '',
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
                                controller
                                        .inWindProductList[index].description ??
                                    '',
                                maxLines: 2,
                                style: Theme.of(context).textTheme.titleMedium,
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
        : CommonWidgets.dataNotFound();
  }
}

class InProgressView extends GetView<SalesController> {
  const InProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.pendingProductList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: controller.pendingProductList.length,
            itemBuilder: (context, index) {
              GetProductDeliveryData item =
                  controller.pendingProductList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.dateTime.toString().substring(0, 10),
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 4.px),
                  ListTile(
                    leading: CommonWidgets.imageView(
                      image: item.image ?? '',
                      height: 44.px,
                      width: 44.px,
                      radius: 0.px,
                    ),
                    title: Text(
                      item.productName ?? '',
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14.px),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'In progress',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 2.px),
                        Text(
                          'Completed on Dec 14.',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    trailing: Text(
                      '${CommonMethods.cur}${item.amount}',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 16.px,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(height: 10.px),
                  Divider(
                    height: 2.px,
                    color: Theme.of(context).colorScheme.onSecondary,
                    thickness: .2.px,
                  ),
                  SizedBox(height: 10.px),
                ],
              );
            },
          )
        : CommonWidgets.dataNotFound();
  }
}

class FinishedView extends GetView<SalesController> {
  const FinishedView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.completeProductList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.completeProductList.length,
            itemBuilder: (context, index) {
              GetProductDeliveryData item =
                  controller.completeProductList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.dateTime.toString().substring(0, 10),
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 4.px),
                  ListTile(
                    leading: CommonWidgets.imageView(
                      image: item.image ?? '',
                      height: 44.px,
                      width: 44.px,
                      radius: 0.px,
                    ),
                    title: Text(
                      item.productName ?? '',
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14.px),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipment',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                          maxLines: 1,
                        ),
                        SizedBox(height: 2.px),
                        Text(
                          'Completed on Dec 14.',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    trailing: Text(
                      '${CommonMethods.cur}${item..amount}',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 16.px,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(height: 10.px),
                  Divider(
                    height: 2.px,
                    color: Theme.of(context).colorScheme.onSecondary,
                    thickness: .2.px,
                  ),
                  SizedBox(height: 10.px),
                ],
              );
            },
          )
        : CommonWidgets.dataNotFound();
  }
}
