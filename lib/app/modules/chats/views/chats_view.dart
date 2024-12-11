import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_models/get_conversation_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_notification_model.dart';

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
        body: Obx(() {
          controller.count.value;
          return Padding(
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
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          controller.tabIndex.value = 0;
                          controller.increment();
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 50.px,
                              margin: EdgeInsets.only(top: 20.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: controller.tabIndex.value == 0
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.1.px),
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Text(
                                StringConstants.message.tr,
                              ),
                            ),
                            if (controller.totalChatCount.value != 0)
                              Positioned(
                                top: 2.px,
                                right: 20.px,
                                child: Container(
                                  height: 20.px,
                                  width: 20.px,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                      border: Border.all(
                                          color: Colors.redAccent,
                                          width: 2.px)),
                                  child: Text(
                                    '${controller.totalChatCount}',
                                    style: TextStyle(
                                        fontSize: 10.px,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          controller.tabIndex.value = 1;
                          controller.increment();
                          controller.callingSeeAllNotificationApi();
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 50.px,
                              margin: EdgeInsets.only(top: 20.px),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: controller.tabIndex.value == 1
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.1.px),
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Text(StringConstants.notification.tr),
                            ),
                            if (controller.totalNotificationCount.value != 0)
                              Positioned(
                                top: 2.px,
                                right: 20.px,
                                child: Container(
                                  height: 20.px,
                                  width: 20.px,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      border: Border.all(
                                          color: Colors.redAccent,
                                          width: 2.px)),
                                  child: Text(
                                    '${controller.totalNotificationCount}',
                                    style: TextStyle(
                                        fontSize: 10.px,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.redAccent),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    /* TabBar(
                      onTap: (value) {
                        controller.tabController.index = value;
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
                    ),*/
                  ],
                ),
                SizedBox(height: 20.px),
                Obx(() {
                  controller.count.value;
                  return Text(
                    controller.tabIndex.value == 0
                        ? StringConstants.chat.tr
                        : StringConstants.notification.tr,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 24.px,
                        ),
                  );
                }),
                SizedBox(height: 8.px),
                Obx(() {
                  controller.count.value;
                  controller.inAsyncCall.value;
                  return controller.inAsyncCall.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: screens(),
                        );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget screens() {
    switch (controller.tabIndex.value) {
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
                margin: EdgeInsets.zero,
                child: ListTile(
                  onTap: () => controller.checkUserType(index),
                  // contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.px)),
                  leading: CommonWidgets.imageView(
                    image: item.productImage ?? '',
                    height: 60.px,
                    width: 60.px,
                    radius: 30.px,
                  ),
                  title: Text(
                    item.productName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 18.px),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.lastMessage ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.date ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12.px,
                                ),
                      ),
                      SizedBox(height: 8.px),
                      if (item.noOfMessage.toString() != '0')
                        Container(
                          height: 24.px,
                          width: 24.px,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12.px),
                          ),
                          child: Center(
                            child: Text(
                              item.noOfMessage.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
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
    return controller.notificationList.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.notificationList.length,
            itemBuilder: (context, index) {
              NotificationData item = controller.notificationList[index];
              return Card(
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
                    item.message ?? '',
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12.px,
                        ),
                  ),
                  trailing: Text(
                    getTimeAgo(item.dateTime!),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12.px,
                        ),
                    textAlign: TextAlign.end,
                  ),
                ),
              );
            })
        : CommonWidgets.dataNotFound();
  }

  String getTimeAgo(String timestamp) {
    if (timestamp == null) {
      return "";
    }
    DateTime dateTime = DateTime.parse(timestamp);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays > 1 && difference.inDays <= 5) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays > 5) {
      return DateFormat('dd-MM-yyyy').format(dateTime);
    } else {
      // Handle future dates
      return 'Future date';
    }
  }
}
