import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      bottomNavigationBar: Container(
          height: 80,
          alignment: Alignment.bottomCenter,
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
      body: Column(children: [
        SizedBox(height: 60.px),
        Card(
          elevation: .2.px,
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px)),
            leading: CommonWidgets.appIcons(
              assetName: IconConstants.icBack,
              height: 34.px,
              width: 34.px,
              borderRadius: 0.px,
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14.px,
                          color:
                              Theme.of(context).textTheme.displayMedium?.color),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(child: Expanded(child: Obx(() {
          controller.messageLoading.value;
          return shoChat();
        })))
      ]),
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
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.px)),
                elevation: .2.px,
                child: item.senderId == controller.userId
                    ? Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.px),
                            topLeft: Radius.circular(10.px),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.chatMessage ?? '',
                              textAlign: TextAlign.center,
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
                            Text(
                              '08:21',
                              textAlign: TextAlign.center,
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
                          ],
                        ))
                    : Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.px),
                            topLeft: Radius.circular(10.px),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              item.chatMessage ?? '',
                              textAlign: TextAlign.center,
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
                            Text(
                              '08:21',
                              textAlign: TextAlign.center,
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
                          ],
                        )),
              );
            },
          )
        : CommonWidgets.dataNotFound();
  }
}
