import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/hashtag_controller.dart';

class HashtagView extends GetView<HashtagController> {
  const HashtagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.hashtag),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.px),
            CommonWidgets.commonTextField(
              hintText: StringConstants.search,
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
                Container(
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
                        Obx(
                          () => Text(
                            controller.selectedValue.value,
                            style: Theme.of(Get.context!)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                        ),
                        SizedBox(width: 10.px),
                        Icon(
                          Icons.highlight_remove_rounded,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  '0/5',
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
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.list.length,
                itemBuilder: (context, index) => Obx(() {
                  controller.count.value;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.px),
                    child: Column(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Theme.of(Get.context!)
                                .primaryColor, // Set the inactive color here
                          ),
                          child: RadioListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            /*shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.px),
                              borderSide: BorderSide(
                                color: Theme.of(Get.context!).colorScheme.surface,
                                width: .4.px,
                              ),
                            ),*/
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              controller.selectedValue.value =
                                  controller.list[index];
                            },
                            title: Text(
                              controller.list[index],
                              style: Theme.of(Get.context!)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                            value: controller.selectedValue.value,
                            groupValue: controller.list[index],
                          ),
                        ),
                        Divider(
                          height: 2.px,
                          color: Theme.of(context).colorScheme.onSecondary,
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
    );
  }
}
