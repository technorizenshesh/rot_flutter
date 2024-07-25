import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

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
          body: ProgressBar(
            inAsyncCall: controller.isLoading.value,
            child: ListView(
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
                          readOnly: true,
                          hintText: StringConstants.enterCountry.tr,
                          suffixIcon: InkWell(
                            onTap: () {
                              //controller.showMyCurrencyPicker();
                              print("Press...");
                              controller.showBottomSheetForCountry();
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 25.px,
                              color: Colors.black87,
                            ),
                          ),
                          prefixIcon: ClipRRect(
                            borderRadius: BorderRadius.circular(25.px),
                            child: CountryFlag.fromCountryCode(
                              controller.countryCode.value,
                              height: 50.px,
                              width: 50.px,
                              borderRadius: 3,
                            ),
                          ),
                          onTap: () {
                            controller.showBottomSheetForCountry();
                          }),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusZipCode,
                          title: StringConstants.zipCode.tr,
                          controller: controller.zipCodeController,
                          keyboardType: TextInputType.text,
                          isCard: controller.isZipCode.value,
                          hintText: StringConstants.enterZipCode.tr,
                          onChanged: (String? value) {
                            if (value!.length >= 4) {
                              //controller.getPlaceFromApi();
                              controller.getAdminLocationApi();
                            }
                          }),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusState,
                        title: StringConstants.state.tr,
                        controller: controller.stateController,
                        isCard: controller.isState.value,
                        hintText: StringConstants.state.tr,
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
                        focusNode: controller.focusStreetName,
                        title: StringConstants.streetNameAndNumber.tr,
                        controller: controller.streetNameAndNumberController,
                        isCard: controller.isStreetName.value,
                        hintText: StringConstants.streetNameAndNumber.tr,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusNumber,
                        title: StringConstants.number.tr,
                        controller: controller.numberController,
                        isCard: controller.isNumber.value,
                        hintText: StringConstants.number.tr,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusFloor,
                        title: StringConstants.floorAndDoorNumber.tr,
                        controller: controller.floorController,
                        isCard: controller.isFloor.value,
                        hintText: StringConstants.enterFloorAndDoorNumber.tr,
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusDoor,
                        title: StringConstants.enterDoor.tr,
                        controller: controller.doorController,
                        isCard: controller.isDoor.value,
                        hintText: StringConstants.enterDoor.tr,
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
        ),
      );
    });
  }
}
