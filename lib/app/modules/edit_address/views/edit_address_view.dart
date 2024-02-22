import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/edit_address_controller.dart';

class EditAddressView extends GetView<EditAddressController> {
  const EditAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.editAddress.tr),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusCountry,
                      title: StringConstants.country.tr,
                      controller: controller.countryController,
                      isCard: controller.isCountry.value,
                      hintText: StringConstants.enterCountry.tr,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusFullName,
                      title: StringConstants.fullName.tr,
                      controller: controller.fullNameController,
                      isCard: controller.isFullName.value,
                      hintText: StringConstants.enterYourFullName.tr,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusStreetNameAndNumber,
                      title: StringConstants.streetNameAndNumber.tr,
                      controller: controller.streetNameAndNumberController,
                      isCard: controller.isStreetNameAndNumberName.value,
                      hintText: StringConstants.enterStreetNameAndNumber.tr,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusFloorAndDoorNumber,
                      title: StringConstants.floorAndDoorNumber.tr,
                      controller: controller.floorAndDoorNumberController,
                      isCard: controller.isFloorAndDoorNumber.value,
                      hintText: StringConstants.enterFloorAndDoorNumber.tr,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusZipCode,
                      title: StringConstants.zipCode.tr,
                      controller: controller.zipCodeController,
                      isCard: controller.isZipCode.value,
                      hintText: StringConstants.enterZipCode.tr,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusCity,
                      title: StringConstants.city.tr,
                      controller: controller.cityController,
                      isCard: controller.isCity.value,
                      hintText: StringConstants.enterCity.tr,
                    ),
                    SizedBox(height: 14.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusPhoneNumber,
                      title: StringConstants.phoneNumber.tr,
                      controller: controller.phoneNumberController,
                      isCard: controller.isPhoneNumber.value,
                      hintText: StringConstants.enterYourPhoneNumber.tr,
                      horizontalPadding: 0,
                      prefixIconHorizontal: 8,
                      prefixIcon: CommonWidgets.countryCodePicker(
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      'We will share your data with the transport company to manage your shipments. To learn more, consult ROT Terms of Use and Privacy Policy.',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 10.px),
                    ),
                    SizedBox(height: 10.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnSaveButton(),
                      childText: Text(
                        StringConstants.save.tr,
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
            ],
          ),
        ),
      );
    });
  }
}
