import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/hashtag_controller.dart';

class HashtagView extends GetView<HashtagController> {
  const HashtagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Theme.of(Get.context!).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(Get.context!).scaffoldBackgroundColor,
          foregroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
          backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
          leading: GestureDetector(
            onTap: () {
              Get.back(result: controller.data);
            },
            child: Center(
              child: CommonWidgets.appIcons(
                assetName: IconConstants.icBack,
                height: 32.px,
                width: 32.px,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            StringConstants.hashtag.tr,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 20.px),
          ),
        ),
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44.px,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.selectedListValueTitle.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.px),
                            height: 40.px,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20.px),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.px),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    controller.selectedListValueTitle[index],
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                  ),
                                  SizedBox(width: 10.px),
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectedListValue.remove(
                                          controller.selectedListValue[index] ??
                                              '');
                                      controller.selectedListValueTitle.remove(
                                          controller.selectedListValueTitle[
                                                  index] ??
                                              '');
                                      controller.increment();
                                    },
                                    child: Icon(
                                      Icons.highlight_remove_rounded,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${controller.selectedListValueTitle.length}/${controller.data.length}',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 14.px,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 20.px),
                if (controller.data.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => Obx(() {
                        controller.count.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.px),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.data[index].hashTagName ?? '',
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor: Theme.of(
                                              Get.context!)
                                          .primaryColor, // Set the inactive color here
                                    ),
                                    child: Checkbox(
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      value: controller.selectedListValue
                                          .contains(
                                              controller.data[index].id ?? ''),
                                      onChanged: (value) {
                                        if (!controller.selectedListValue
                                            .contains(
                                                controller.data[index].id ??
                                                    '')) {
                                          controller.selectedListValue.add(
                                            controller.data[index].id ?? '',
                                          );
                                          controller.selectedListValueTitle.add(
                                            controller
                                                    .data[index].hashTagName ??
                                                '',
                                          );
                                          controller.increment();
                                        } else {
                                          controller.selectedListValue.remove(
                                              controller.data[index].id ?? '');

                                          controller.selectedListValueTitle
                                              .remove(
                                            controller
                                                    .data[index].hashTagName ??
                                                '',
                                          );
                                        }
                                        controller.increment();
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                height: 2.px,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                thickness: .2.px,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
