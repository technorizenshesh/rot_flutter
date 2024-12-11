import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_linked_device_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/linked_devices_controller.dart';

class LinkedDevicesView extends GetView<LinkedDevicesController> {
  const LinkedDevicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.linkedDevices),
          bottomNavigationBar: controller.linkedDeviceList.isNotEmpty
              ? CommonWidgets.commonElevatedButton(
                  onPressed: () {
                    controller.clickOnUnlink(-1);
                  },
                  childText: Text(
                    StringConstants.unLinkAllDevices,
                    style: TextStyle(
                        fontSize: 16.px,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  buttonMargin:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px))
              : SizedBox(
                  height: 1.px,
                ),
          body: ProgressBar(
              inAsyncCall: controller.inAsyncCall.value,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.px),
                        Text(
                          "There are ${controller.linkedDeviceList.length} devices that accessed your account in the last 6 months. If you don't recognize a device, we recommend unlinking it to keep your account secure.",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),
                        SizedBox(height: 20.px),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.linkedDeviceList.length,
                          itemBuilder: (context, index) {
                            LinkedDeviceData item =
                                controller.linkedDeviceList[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    height: 60.px,
                                    width: 60.px,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary
                                            .withOpacity(.2.px),
                                        borderRadius:
                                            BorderRadius.circular(14.px)),
                                    child: Center(
                                      child: CommonWidgets.appIcons(
                                        assetName: IconConstants.icPhone,
                                        height: 30.px,
                                        width: 30.px,
                                        borderRadius: 0.px,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    '${item.deviceName}',
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 18.px),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${item.deviceId}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontSize: 12.px,
                                            ),
                                        maxLines: 1,
                                      ),
                                      SizedBox(height: 2.px),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            timeAgo(item.dateTime.toString()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontSize: 12.px,
                                                ),
                                            maxLines: 1,
                                          ),
                                          if (item.token != null &&
                                              item.token != '')
                                            GestureDetector(
                                              onTap: () {
                                                controller.clickOnUnlink(index);
                                              },
                                              child: Container(
                                                height: 25.px,
                                                width: 60.px,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.px),
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.teal,
                                                        width: 1.px)),
                                                child: const Text(
                                                  StringConstants.unLink,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.teal,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                  // trailing: Text(
                                  //   'Unlink',
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .titleMedium
                                  //       ?.copyWith(
                                  //           fontSize: 14.px,
                                  //           color: Theme.of(context).primaryColor),
                                  // ),
                                ),
                                SizedBox(height: 10.px),
                                Divider(
                                  height: 2.px,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  thickness: .2.px,
                                ),
                                SizedBox(height: 10.px),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )));
    });
  }

  String timeAgo(String dateTimeString) {
    DateTime messageTime = DateTime.parse(dateTimeString);
    DateTime currentTime = DateTime.now();

    Duration difference = currentTime.difference(messageTime);

    if (difference.inDays > 7) {
      // More than 24 hours
      return DateFormat('yyyy-MM-dd').format(messageTime);
    } else if (difference.inDays >= 1) {
      // More than 24 hours
      return '${difference.inDays} days ago';
    } else if (difference.inHours >= 1 && difference.inHours < 24) {
      // More than 60 minutes but less than 24 hours
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      // Less than 60 minutes
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
