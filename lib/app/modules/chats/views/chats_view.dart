import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_models/get_conversation_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.px),
              Text(
                StringConstants.message.tr,
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
                controller.count.value;
                return Text(
                  controller.tabController.index == 0
                      ? StringConstants.chat.tr
                      : StringConstants.notification.tr,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 24.px,
                      ),
                );
              }),
              SizedBox(height: 8.px),
              Obx(() {
                controller.inAsyncCall.value;
                return controller.inAsyncCall.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
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
        return const MessageView();
      default:
        return const ChatNotificationView();
    }
  }
}

class MessageView extends GetView<ChatsController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.getConversationList.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.getConversationList.length,
            itemBuilder: (context, index) {
              GetConversationResult item =
                  controller.getConversationList[index];
              return Card(
                elevation: .2.px,
                child: ListTile(
                  onTap: () => controller.clickOnMessageTile(index),
                  // contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.px)),
                  leading: CommonWidgets.imageView(
                    image: item.image ?? '',
                    height: 60.px,
                    width: 60.px,
                    radius: 30.px,
                  ),
                  title: Text(
                    item.userName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 20.px),
                  ),
                  subtitle: Text(
                    item.lastMessage ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.date ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      SizedBox(height: 8.px),
                      Container(
                        height: 24.px,
                        width: 24.px,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12.px),
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
        : SizedBox(
            height: 300,
            child: CommonWidgets.dataNotFound(),
          );
  }
}

class ChatNotificationView extends GetView<ChatsController> {
  const ChatNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 4,
      itemBuilder: (context, index) => Card(
        elevation: .2.px,
        child: ListTile(
          // contentPadding: EdgeInsets.zero,
          leading: CommonWidgets.appIcons(
            assetName: IconConstants.icUserImage,
            height: 60.px,
            width: 60.px,
            borderRadius: 4.px,
          ),
          title: Text(
            'Reserved',
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 20.px),
          ),
          subtitle: Text(
            'Someone you follow has uploaded new items',
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.px,
                ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '2 hours ago',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14.px,
                    ),
              ),
              SizedBox(height: 8.px),
              Container(
                height: 24.px,
                width: 24.px,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12.px),
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
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
