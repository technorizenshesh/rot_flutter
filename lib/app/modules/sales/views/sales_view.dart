import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_methods.dart';
import 'package:rot/common/common_widgets.dart';

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
            appBar: CommonWidgets.appBar(title: StringConstants.sales),
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
                    return Expanded(
                      child: screens(),
                    );
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
    return SingleChildScrollView(
      child: Wrap(
        children: List.generate(controller.listOfCards.length, (index) {
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
                          child: Image.asset(
                            controller.listOfCards[index]['image'],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                controller.listOfCards[index]['price'],
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.px,
                                      color: Theme.of(context).primaryColor,
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
                          controller.listOfCards[index]['subTitle'],
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
    );
  }
}

class InProgressView extends GetView<SalesController> {
  const InProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    /* return ListView.builder(
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
    );*/
  }
}

class FinishedView extends GetView<SalesController> {
  const FinishedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20.px),
        Text(
          '2023',
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 26.px),
        ),
        SizedBox(height: 2.px),
        Text(
          'January',
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 16.px),
        ),
        SizedBox(height: 20.px),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'December',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16.px),
              ),
              SizedBox(height: 4.px),
              ListTile(
                leading: CommonWidgets.appIcons(
                  assetName: 'assets/un_used_images/eyerphones.png',
                  height: 44.px,
                  width: 44.px,
                  borderRadius: 0.px,
                ),
                title: Text(
                  '5 2.5" SSD hard drives pre...',
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12.px,
                          ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 2.px),
                    Text(
                      'Completed on Dec 14.',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12.px,
                          ),
                      maxLines: 1,
                    ),
                  ],
                ),
                trailing: Text(
                  '${CommonMethods.cur}949.00',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.px, color: Theme.of(context).primaryColor),
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
          ),
        ),
      ],
    );
  }
}
