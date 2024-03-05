import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.profile.tr,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 24.px, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 20.px),
                GestureDetector(
                  onTap: () => controller.clickOnDetailCard(),
                  child: Card(
                    elevation: .4.px,
                    child: Padding(
                      padding: EdgeInsets.all(8.px),
                      child: Row(
                        children: [
                          CommonWidgets.appIcons(
                            assetName: ImageConstants.imageSupport,
                            height: 80.px,
                            width: 80.px,
                            borderRadius: 50.px,
                          ),
                          SizedBox(width: 20.px),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tommy Jason',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 20.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(height: 4.px),
                              Text(
                                'tommyjason@gmail.com',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                              ),
                              SizedBox(height: 4.px),
                              Text(
                                '⭐⭐⭐⭐⭐ 5',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.px),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
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
              itemCount: controller.listOfListTile.length),
          SizedBox(height: 12.px),
        ],
      ),
    );
  }
}
