import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';

import '../controllers/two_step_verification_two_controller.dart';

class TwoStepVerificationTwoView
    extends GetView<TwoStepVerificationTwoController> {
  const TwoStepVerificationTwoView({Key? key}) : super(key: key);

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
                StringConstants.verifyThatThisAccount,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              SizedBox(height: 20.px),
              Text(
                StringConstants.chooseHowToReceive,
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
                                  assetName: IconConstants.icEmail,
                                  height: 30.px,
                                  width: 30.px,
                                  borderRadius: 0.px,
                                ),
                              ),
                            ),
                            title: Text(
                              'SMS',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 18.px),
                            ),
                            subtitle: Text(
                              'To the cell phone ending in 5953',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontSize: 12.px,
                                  ),
                              maxLines: 1,
                            ),
                            trailing: Image.asset(
                              IconConstants.icRightArrow,
                              height: 24.px,
                              width: 24.px,
                              fit: BoxFit.cover,
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
