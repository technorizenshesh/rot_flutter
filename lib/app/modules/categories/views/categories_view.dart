import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.categories),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Wrap(
                    children: List.generate(controller.list.length, (index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 3.4,
                        child: InkWell(
                          onTap: () => controller.clickOnCard(index: index),
                          borderRadius: BorderRadius.circular(8.px),
                          child: Container(
                            // height: 100.px,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.px),
                              border: Border.all(
                                width: .4.px,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 65.px,
                                  height: 65.px,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(.4.px),
                                    borderRadius:
                                    BorderRadius.circular(34.px),
                                  ),
                                  child: Center(
                                    child: CommonWidgets.appIcons(
                                      assetName: controller.list[index]['icon'],
                                      width: 28.px,
                                      height: 28.px,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14.px),
                                Text(
                                  controller.list[index]['title'],
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                SizedBox(height: 14.px),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
