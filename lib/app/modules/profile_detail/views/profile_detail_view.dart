import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_detail_controller.dart';

class ProfileDetailView extends GetView<ProfileDetailController> {
  const ProfileDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.profile),
        body: controller.inAsyncCall.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
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
                              GestureDetector(
                                onTap: () {
                                  controller.getImage();
                                },
                                child: Stack(
                                  children: [
                                    (controller.selectedFile == null)
                                        ? CommonWidgets.imageView(
                                            image: controller.userData!.image ??
                                                '',
                                            height: 80.px,
                                            width: 80.px,
                                            borderRadius:
                                                BorderRadius.circular(40.px),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40.px),
                                            child: Image.file(
                                              controller.selectedFile!,
                                              height: 80.px,
                                              fit: BoxFit.fill,
                                              width: 80.px,
                                            ),
                                          ),
                                    const Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Icon(
                                          Icons.photo,
                                          size: 20,
                                          color: Colors.teal,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(width: 20.px),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (controller.userData != null &&
                                      controller.userData!.userName != null &&
                                      controller.userData!.userName!.isNotEmpty)
                                    Row(
                                      children: [
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
                                        CommonWidgets.appIcons(
                                            assetName: IconConstants.icFlag1,
                                            width: 25,
                                            height: 20)
                                      ],
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
                          labelStyle: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                          indicatorSize: TabBarIndicatorSize
                              .tab, // Set indicatorSize to tab
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Obx(() {
                        controller.count.value;
                        return Text(
                          tabText(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
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
    });
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
    return Obx(() {
      controller.count.value;
      return ListView(
        children: [
          SizedBox(height: 20.px),
          /*CommonWidgets.commonTextFieldForLoginSignUP(
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
            ),*/
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusFullName,
            title: StringConstants.fullName.tr,
            controller: controller.fullNameController,
            isCard: controller.isFullName.value,
            hintText: StringConstants.enterYourFullName.tr,
            prefixIcon: CommonWidgets.appIcons(
              assetName: IconConstants.icUser,
              color: controller.isFullName.value
                  ? Theme.of(Get.context!).primaryColor
                  : Theme.of(Get.context!).colorScheme.onSecondaryContainer,
            ),
          ),
          SizedBox(height: 14.px),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusSellersAddress,
            title: StringConstants.sellersAddress,
            controller: controller.sellersAddressController,
            isCard: controller.isSellersAddress.value,
            hintText: StringConstants.enterYourSellersAddress,
          ),
          SizedBox(height: 20.px),
          Text(
            'Sells In',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.px,
                ),
          ),
          SizedBox(height: 14.px),
          CommonWidgets.appIcons(
            assetName: IconConstants.icFlagGroup,
            height: 70,
          ),
          SizedBox(height: 14.px),
          CommonWidgets.commonElevatedButton(
            onPressed: () => controller.clickOnSubmitButton(),
            childText: Text(
              StringConstants.submit.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 20.px),
        ],
      );
    });
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
    return controller.userData!.reviewCount != '0'
        ? ListView.builder(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.px, vertical: 4.px),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            '5 ⭐',
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
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
          )
        : SizedBox(
            height: 300,
            child: CommonWidgets.dataNotFound(),
          );
  }
}
