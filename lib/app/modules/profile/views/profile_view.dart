import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.profile.tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 24.px,
                              color: Theme.of(context).primaryColor),
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
                              (controller.userData != null &&
                                      controller.userData!.image != null &&
                                      controller.userData!.image!.isNotEmpty)
                                  ? CommonWidgets.imageView(
                                      image: controller.userData!.image ?? '',
                                      height: 80.px,
                                      width: 80.px,
                                      borderRadius:
                                          BorderRadius.circular(40.px),
                                    )
                                  : CommonWidgets.appIcons(
                                      assetName: IconConstants.icUserImage,
                                      height: 80.px,
                                      width: 80.px,
                                      borderRadius: 40.px),
                              SizedBox(width: 20.px),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.userData != null &&
                                      controller.userData!.userName != null &&
                                      controller.userData!.userName!.isNotEmpty)
                                    Text(
                                      controller.userData!.userName ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 20.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  SizedBox(height: 4.px),
                                  if (controller.userData != null &&
                                      controller.userData!.email != null &&
                                      controller.userData!.email!.isNotEmpty)
                                    Text(
                                      controller.userData!.email ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontSize: 12.px,
                                          ),
                                    ),
                                  SizedBox(height: 4.px),
                                  if (controller.userData != null &&
                                      controller.userData!.reviewCount !=
                                          null &&
                                      controller
                                          .userData!.reviewCount!.isNotEmpty)
                                    Text(
                                      "⭐ ${controller.userData!.reviewCount ?? ''}",
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
        ),
      );
    });
  }
}
