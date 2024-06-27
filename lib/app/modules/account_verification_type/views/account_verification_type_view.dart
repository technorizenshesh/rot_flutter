import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/icons_constant.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/account_verification_type_controller.dart';

class AccountVerificationTypeView
    extends GetView<AccountVerificationTypeController> {
  const AccountVerificationTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CommonWidgets.appBar(title: ''),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.verityThatThisAccountBelongsToYou,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 18.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.chooseHowToReceiveTheVerificationCode,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 12.px,
                          ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20.px),
                    ListTile(
                      onTap: () {
                        controller.clickOnCard(0);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.px),
                          side: BorderSide(color: Colors.grey, width: 1.px)),
                      leading: CommonWidgets.appIcons(
                          assetName: IconConstants.icEmail,
                          height: 35.px,
                          width: 35.px,
                          fit: BoxFit.fill),
                      title: Text(
                        StringConstants.sms,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 16.px,
                                ),
                      ),
                      subtitle: Text(
                        'To the call phone ending in the ${controller.phone.value}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.px,
                            ),
                      ),
                      trailing: CommonWidgets.appIcons(
                          assetName: IconConstants.icRightArrow,
                          height: 25.px,
                          width: 25.px,
                          fit: BoxFit.fill),
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    ListTile(
                      onTap: () {
                        controller.clickOnCard(1);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.px),
                          side: BorderSide(color: Colors.grey, width: 1.px)),
                      leading: CommonWidgets.appIcons(
                          assetName: IconConstants.icWhatsApp,
                          height: 35.px,
                          width: 35.px,
                          fit: BoxFit.fill),
                      title: Text(
                        StringConstants.whatsApp,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 16.px,
                                ),
                      ),
                      subtitle: Text(
                        'To the call phone ending in the ${controller.phone.value}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.px,
                            ),
                      ),
                      trailing: CommonWidgets.appIcons(
                          assetName: IconConstants.icRightArrow,
                          height: 25.px,
                          width: 25.px,
                          fit: BoxFit.fill),
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    ListTile(
                      onTap: () {
                        controller.clickOnCard(2);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.px),
                          side: BorderSide(color: Colors.grey, width: 1.px)),
                      leading: CommonWidgets.appIcons(
                          assetName: IconConstants.icCall,
                          height: 30.px,
                          width: 30.px,
                          fit: BoxFit.fill),
                      title: Text(
                        StringConstants.phoneCall,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 16.px,
                                ),
                      ),
                      subtitle: Text(
                        'To the call phone ending in the ${controller.phone.value}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.px,
                            ),
                      ),
                      trailing: CommonWidgets.appIcons(
                          assetName: IconConstants.icRightArrow,
                          height: 25.px,
                          width: 25.px,
                          fit: BoxFit.fill),
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    ListTile(
                      onTap: () {
                        controller.clickOnCard(3);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.px),
                          side: BorderSide(color: Colors.grey, width: 1.px)),
                      leading: CommonWidgets.appIcons(
                          assetName: IconConstants.icEmail,
                          height: 35.px,
                          width: 35.px,
                          fit: BoxFit.fill),
                      title: Text(
                        StringConstants.mail,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 16.px,
                                ),
                      ),
                      subtitle: Text(
                        'To the mail ending in the ${controller.email.value}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.px,
                            ),
                      ),
                      trailing: CommonWidgets.appIcons(
                          assetName: IconConstants.icRightArrow,
                          height: 25.px,
                          width: 25.px,
                          fit: BoxFit.fill),
                    ),
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
