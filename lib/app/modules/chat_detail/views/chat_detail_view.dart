import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/apis/api_models/get_chat_model.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/chat_detail_controller.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Container(
          height: 80,
          padding: EdgeInsets.all(10.px),
          child: Obx(() {
            controller.textMessageLoading.value;
            return controller.textMessageLoading.value
                ? Container(
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    child: const CircularProgressIndicator(),
                  )
                : TextField(
                    controller: controller.messageController,
                    maxLines: 1,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontSize: 14.px),
                    decoration: InputDecoration(
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (controller
                                  .messageController.text.isNotEmpty) {
                                controller.textMessageLoading.value = true;
                                controller.insertChatApi(
                                    controller.messageController.text);
                              } else {
                                CommonWidgets.showMyToastMessage(
                                    'Please enter message');
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.px, vertical: 2.px),
                              child: CommonWidgets.appIcons(
                                assetName: IconConstants.icSend,
                                height: 50.px,
                                width: 50.px,
                                borderRadius: 0.px,
                              ),
                            ),
                          ),
                        ],
                      ),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.px, vertical: 2.px),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.attach_file_rounded,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.color,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.1.px),
                      filled: true,
                      disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.px),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.px),
                          borderSide: BorderSide.none),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.px),
                          borderSide: BorderSide.none),
                      hintText: StringConstants.typeHere.tr,
                      hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
                    ),
                  );
          })),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(height: 60.px),
          Card(
            elevation: .2.px,
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.px)),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CommonWidgets.appIcons(
                  assetName: IconConstants.icBack,
                  height: 34.px,
                  width: 34.px,
                  borderRadius: 0.px,
                ),
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.imageView(
                    image: controller.userImage,
                    height: 40.px,
                    width: 40.px,
                    radius: 20.px,
                  ),
                  SizedBox(width: 8.px),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${CommonMethods.cur} ${controller.userAmount}',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 20.px),
                        ),
                        Text(
                          controller.userName,
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 14.px,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.more_vert_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.px,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.px),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icGetPaidInPerson,
                            height: 16.px,
                            width: 16.px,
                            borderRadius: 0.px,
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            StringConstants.getPaid.tr,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(width: 10.px),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.px,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.px),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icEditPrice,
                            height: 16.px,
                            width: 16.px,
                            borderRadius: 0.px,
                          ),
                          SizedBox(width: 10.px),
                          Text(
                            StringConstants.editPrice.tr,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.px),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.px),
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.1.px),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.px),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      CommonWidgets.appIcons(
                        assetName: IconConstants.icSecurityReasons,
                        height: 16.px,
                        width: 16.px,
                        borderRadius: 0.px,
                      ),
                      SizedBox(width: 14.px),
                      Text(
                        StringConstants.forSecurity.tr,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.color),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(child: Expanded(child: Obx(() {
            controller.count.value;
            return shoChat();
          })))
        ]),
      ),
    );
  }

  Widget shoChat() {
    return controller.chatResultList.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.chatResultList.length,
            itemBuilder: (context, index) {
              ChatResult item = controller.chatResultList[index];
              return Container(
                width: double.infinity,
                alignment: item.senderId == controller.userId
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: item.senderId == controller.userId
                          ? Colors.grey.withOpacity(0.3)
                          : Colors.teal.withOpacity(0.5)),
                  child: Column(
                    crossAxisAlignment: item.senderId == controller.userId
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.chatMessage ?? '',
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: item.senderId == controller.userId
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Text(
                            item.date == null
                                ? ""
                                : (DateFormat('HH:mm a')
                                        .format(DateTime.parse(item.date!)))
                                    .toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            item.date == null ? "" : getTimeAgo(item.date!),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : SizedBox(height: 300, child: CommonWidgets.dataNotFound());
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
