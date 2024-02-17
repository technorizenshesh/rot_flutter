import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/general_setting_controller.dart';

class GeneralSettingView extends GetView<GeneralSettingController> {
  const GeneralSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.generalSetting),
      body: ListView(
        children: [
          SizedBox(height: 20.px),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.px),
                        child: ListTile(
                          onTap: () => controller.clickOnListTile(index: index),
                          leading: CommonWidgets.appIcons(
                            assetName: controller.listOfListTile[index]['icon'],
                            height: 40.px,
                            width: 40.px,
                          ),
                          trailing: Image.asset(
                            IconConstants.icRightArrow,
                            height: 24.px,
                            width: 24.px,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            controller.listOfListTile[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      Divider(
                        height: 2.px,
                        color: Theme.of(context).colorScheme.onSecondary,
                        thickness: .2.px,
                      ),
                    ],
                  ),
              itemCount: controller.listOfListTile.length),
        ],
      ),
    );
  }
}
