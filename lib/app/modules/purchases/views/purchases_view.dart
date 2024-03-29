import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/purchases_controller.dart';

class PurchasesView extends GetView<PurchasesController> {
  const PurchasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return SafeArea(
        child: DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Scaffold(
            appBar: CommonWidgets.appBar(title: StringConstants.purchases),
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
        return const CompletedView();
      default:
        return const OngoingView();
    }
  }
}

class CompletedView extends GetView<PurchasesController> {
  const CompletedView({super.key});

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

class OngoingView extends GetView<PurchasesController> {
  const OngoingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => Card(
        elevation: .2.px,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.appIcons(
              assetName: 'assets/un_used_images/eyerphones.png',
              height: 130.px,
              width: 130.px,
              borderRadius: 10.px,
            ),
            SizedBox(width: 10.px),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5 2.5" SSD hard drives pre...',
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    'Colour: Made Blue',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12.px,
                        ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 12.px),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          '${CommonMethods.cur}949.00',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                      SizedBox(width: 10.px),
                      Flexible(
                        child: Text(
                          '${CommonMethods.cur}465.00',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                decorationColor:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.px),
            InkWell(
              onTap: () => controller.clickOnOngoing(),
              borderRadius: BorderRadius.circular(10.px),
              child: Text(
                'Ongoing',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 16.px, color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
