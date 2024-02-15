import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/image_constants.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';

import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends GetView<ProfileDetailController> {
  const ProfileDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.profile),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.px),
              Card(
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
              SizedBox(height: 20.px),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.1.px),
                  borderRadius: BorderRadius.circular(8.px),
                ),
                child: TabBar(
                  onTap: (value) {
                    controller.increment();
                  },
                  splashBorderRadius: BorderRadius.circular(8.px),
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.px),
                    color: Theme.of(context).primaryColor,
                  ),
                  labelColor: Theme.of(context).scaffoldBackgroundColor,
                  unselectedLabelColor:
                      Theme.of(context).textTheme.displayMedium?.color,
                  tabs: controller.tabs,
                  labelStyle:
                      Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 14.px,
                            color: Theme.of(context).primaryColor,
                          ),
                  indicatorSize:
                      TabBarIndicatorSize.tab, // Set indicatorSize to tab
                ),
              ),
              SizedBox(height: 20.px),
              Obx(() {
                controller.count.value;
                return Text(
                  tabText(),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 24.px,
                      ),
                );
              }),
              SizedBox(height: 8.px),
              Obx(() {
                controller.count.value;
                return Expanded(
                  child: screens(),
                );
              }),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      ),
    );
  }

  Widget screens() {
    switch (controller.tabController.index) {
      case 0:
        return const ProfileDetailsView();
      case 1:
        return const AccountView();
      default:
        return const ReviewsView();
    }
  }

  String tabText() {
    switch (controller.tabController.index) {
      case 0:
        return StringConstants.publicInformation;
      case 1:
        return StringConstants.personalInformation;
      default:
        return StringConstants.reviews;
    }
  }
}

class ProfileDetailsView extends GetView<ProfileDetailController> {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            SizedBox(height: 20.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: controller.focusFirstName,
              title: StringConstants.firstName,
              controller: controller.firstNameController,
              isCard: controller.isFirstName.value,
              hintText: StringConstants.enterYourFirstName,
            ),
            SizedBox(height: 14.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: controller.focusLastName,
              title: StringConstants.lastName,
              controller: controller.lastNameController,
              isCard: controller.isLastName.value,
              hintText: StringConstants.enterYourLastName,
            ),
            SizedBox(height: 14.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: controller.focusSellersAddress,
              title: StringConstants.sellersAddress,
              controller: controller.sellersAddressController,
              isCard: controller.isSellersAddress.value,
              hintText: StringConstants.enterYourSellersAddress,
            ),
            SizedBox(height: 14.px),
          ],
        ));
  }
}

class AccountView extends GetView<ProfileDetailController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            SizedBox(height: 20.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: controller.focusDob,
              title: StringConstants.dob,
              controller: controller.dobController,
              isCard: controller.isDob.value,
              hintText: StringConstants.enterYourDob,
            ),
            SizedBox(height: 14.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: controller.focusGender,
              title: StringConstants.gender,
              controller: controller.genderController,
              isCard: controller.isGender.value,
              hintText: StringConstants.enterYourGender,
            ),
            SizedBox(height: 14.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: controller.focusEmail,
              title: StringConstants.email,
              controller: controller.emailController,
              isCard: controller.isEmail.value,
              hintText: StringConstants.enterYourEmail,
            ),
            SizedBox(height: 14.px),
            CommonWidgets.commonTextFieldForLoginSignUP(
              focusNode: controller.focusPhone,
              title: StringConstants.phoneNumber,
              controller: controller.phoneController,
              isCard: controller.icPhone.value,
              hintText: StringConstants.enterYourPhoneNumber,
              horizontalPadding: 0,
              prefixIconHorizontal: 8,
              prefixIcon: CommonWidgets.countryCodePicker(
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 14.px),
          ],
        ));
  }
}

class ReviewsView extends GetView<ProfileDetailController> {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 4.px),
      itemCount: 4,
      itemBuilder: (context, index) => Card(
        elevation: .2.px,
        child: Column(
          children: [
            ListTile(
              // contentPadding: EdgeInsets.zero,
              leading: CommonWidgets.appIcons(
                assetName: IconConstants.icUserImage,
                height: 60.px,
                width: 60.px,
                borderRadius: 4.px,
              ),
              title: Text(
                'Justin Schleifer',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16.px),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.px,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.px, vertical: 4.px),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '5 ⭐',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 14.px,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(height: 10.px),
            Padding(
              padding: EdgeInsets.all(8.px),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Amet non elementum fermentum eu non nisi vestibulum. Lectus phasellus libero hendrerit nibh euismod arcu at. Egestas lacinia ut hendrerit etiam id sollicitudin.',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
    );
  }
}
