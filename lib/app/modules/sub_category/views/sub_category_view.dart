import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/sub_category_controller.dart';

class SubCategoryView extends GetView<SubCategoryController> {
  const SubCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: controller.title),
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: controller.data.isNotEmpty
                ? ListView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            ListTile(
                              onTap: () =>
                                  controller.clickOnListTile(index: index),
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                controller.data[index].subCatName ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 18.px),
                              ),
                              trailing: Image.asset(
                                IconConstants.icRightArrow,
                                height: 24.px,
                                width: 24.px,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8.px),
                            Divider(
                              height: 2.px,
                              color: Theme.of(context).colorScheme.onSecondary,
                              thickness: .2.px,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.px),
                    ],
                  )
                : controller.getSubCategoryModel == null
                    ? const SizedBox()
                    : CommonWidgets.dataNotFound(),
          ),
        ),
      );
    });
  }
}
