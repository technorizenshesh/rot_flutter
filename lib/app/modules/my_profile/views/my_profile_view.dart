
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnEditButton(),
              child: Text(
                StringConstants.edit,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.px),
                CommonWidgets.appBarView(title: StringConstants.myProfile),
                SizedBox(height: 20.px),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.px),
                  child: Image.asset(
                    ImageConstants.imageSupport,
                    height: 100.px,
                    width: 100.px,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.px),
                Text(
                  'Tommy Jason',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 4.px),
                Text(
                  'tommyjason@gmail.com',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                SizedBox(height: 20.px),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringConstants.personalInfo,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.px,
                        color: Theme.of(context).textTheme.titleSmall?.color),
                  ),
                ),
                SizedBox(height: 20.px),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () => controller.clickOnListTilePersonalInfo(
                              index: index),
                          trailing: controller
                                  .listOfListTilePersonalInfoTrailing[index]
                                  .toString()
                                  .isEmpty
                              ? Obx(
                                  () => CupertinoSwitch(
                                    activeColor: Theme.of(context).primaryColor,
                                    value: controller.switchValue.value,
                                    onChanged: (value) {
                                      controller.switchValue.value =
                                          !controller.switchValue.value;
                                    },
                                  ),
                                )
                              : Text(
                                  controller.listOfListTilePersonalInfoTrailing[
                                      index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                          title: Text(
                            controller.listOfListTilePersonalInfoTitles[index],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.color),
                          ),
                        ),
                    itemCount:
                        controller.listOfListTilePersonalInfoTitles.length),
                SizedBox(height: 12.px),
                SizedBox(height: 20.px),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringConstants.contactInfo,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.px,
                        color: Theme.of(context).textTheme.titleSmall?.color),
                  ),
                ),
                SizedBox(height: 20.px),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () => controller.clickOnListTilePersonalInfo(
                              index: index),
                          trailing: Text(
                            controller.listOfListTileContactInfoTrailing[index],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          title: Text(
                            controller.listOfListTileContactInfoTitles[index],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.color),
                          ),
                        ),
                    itemCount:
                        controller.listOfListTileContactInfoTitles.length),
                SizedBox(height: 100.px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
