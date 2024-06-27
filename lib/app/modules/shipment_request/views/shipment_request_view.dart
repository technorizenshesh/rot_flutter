import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/shipment_request_controller.dart';

class ShipmentRequestView extends GetView<ShipmentRequestController> {
  const ShipmentRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      controller.clickOnSendRequestButton();
                    },
                    childText: Text(
                      StringConstants.send.tr,
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
            appBar:
                CommonWidgets.appBar(title: StringConstants.reportProduct.tr),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          title: StringConstants.country.tr,
                          hintText: StringConstants.country.tr,
                          readOnly: true,
                          controller: controller.productNameController),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          controller: controller.descriptionController,
                          isCard: controller.isDescription.value,
                          focusNode: controller.focusDescription,
                          hintText: StringConstants.message.tr,
                          title: StringConstants.message.tr,
                          hintTextColor: controller.isDescription.value,
                          maxLines: 5),
                      SizedBox(height: 20.px),
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
