import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/history_of_movements_controller.dart';

class HistoryOfMovementsView extends GetView<HistoryOfMovementsController> {
  const HistoryOfMovementsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar:
            CommonWidgets.appBar(title: StringConstants.historyOfMovements.tr),
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
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget screens() {
    switch (controller.tabController.index) {
      case 0:
        return const AllView();
      case 1:
        return const AppetizerView();
      default:
        return const DeparturesView();
    }
  }
}

class AllView extends GetView<HistoryOfMovementsController> {
  const AllView({super.key});

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
          padding: EdgeInsets.zero,
          itemCount: 2,
          itemBuilder: (context, index) => Card(
            elevation: .2.px,
            child: ListTile(
              // onTap: () => controller.clickOnMessageTile(),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.px)),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CommonWidgets.appIcons(
                    assetName: 'assets/un_used_images/image_head _phones.png',
                    height: 60.px,
                    width: 60.px,
                    borderRadius: 14.px,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.px),
                    child: CommonWidgets.appIcons(
                      assetName: IconConstants.icIn,
                      height: 24.px,
                      width: 24.px,
                      borderRadius: 0.px,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Recharge',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 20.px),
              ),
              subtitle: Text(
                'Recharge Jan 10',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
              trailing: Text(
                '\$949.00',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppetizerView extends GetView<HistoryOfMovementsController> {
  const AppetizerView({super.key});

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
          padding: EdgeInsets.zero,
          itemCount: 2,
          itemBuilder: (context, index) => Card(
            elevation: .2.px,
            child: ListTile(
              // onTap: () => controller.clickOnMessageTile(),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.px)),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CommonWidgets.appIcons(
                    assetName: 'assets/un_used_images/image_head _phones.png',
                    height: 60.px,
                    width: 60.px,
                    borderRadius: 14.px,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.px),
                    child: CommonWidgets.appIcons(
                      assetName: IconConstants.icOut,
                      height: 24.px,
                      width: 24.px,
                      borderRadius: 0.px,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Recharge',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 20.px),
              ),
              subtitle: Text(
                'Recharge Jan 10',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
              trailing: Text(
                '\$949.00',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DeparturesView extends GetView<HistoryOfMovementsController> {
  const DeparturesView({super.key});

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
          padding: EdgeInsets.zero,
          itemCount: 2,
          itemBuilder: (context, index) => Card(
            elevation: .2.px,
            child: ListTile(
              // onTap: () => controller.clickOnMessageTile(),
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.px)),
              leading: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CommonWidgets.appIcons(
                    assetName: 'assets/un_used_images/image_head _phones.png',
                    height: 60.px,
                    width: 60.px,
                    borderRadius: 14.px,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.px),
                    child: CommonWidgets.appIcons(
                      assetName: IconConstants.icIn,
                      height: 24.px,
                      width: 24.px,
                      borderRadius: 0.px,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Recharge',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 20.px),
              ),
              subtitle: Text(
                'Recharge Jan 10',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
              trailing: Text(
                '\$949.00',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px,
                    color: Theme.of(context).colorScheme.error),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
