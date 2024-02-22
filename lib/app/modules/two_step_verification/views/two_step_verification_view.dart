import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/two_step_verification_controller.dart';

class TwoStepVerificationView extends GetView<TwoStepVerificationController> {
  const TwoStepVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar:
            CommonWidgets.appBar(title: StringConstants.twoStepVerification),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Text(
                StringConstants.twoStepVerification,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 40.px),
              Text(
                StringConstants.useVerificationMethods,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14.px),
              ),
              SizedBox(height: 20.px),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => controller.clickOnCard(),
                      child: Card(
                        elevation: .4.px,
                        child: Padding(
                          padding: EdgeInsets.all(10.px),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 60.px,
                              width: 60.px,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.2.px),
                                  borderRadius: BorderRadius.circular(14.px)),
                              child: Center(
                                child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icPhone,
                                  height: 30.px,
                                  width: 30.px,
                                  borderRadius: 0.px,
                                ),
                              ),
                            ),
                            title: Text(
                              'QR code',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 18.px),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You scan a QR code from the Mercado Pago app.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                  maxLines: 1,
                                ),
                                SizedBox(height: 8.px),
                                Text(
                                  'Activate it from the App',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 12.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
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
