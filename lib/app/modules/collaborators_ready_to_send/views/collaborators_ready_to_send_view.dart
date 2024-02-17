import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/collaborators_ready_to_send_controller.dart';

class CollaboratorsReadyToSendView
    extends GetView<CollaboratorsReadyToSendController> {
  const CollaboratorsReadyToSendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.collaborators),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: ListView(
          children: [
            SizedBox(height: 60.px),
            Center(
                child: CommonWidgets.appIcons(
                    assetName: IconConstants.icVerifyProfile,
                    width: 100.px,
                    height: 100.px,
                    borderRadius: 50.px)),
            SizedBox(height: 40.px),
            Text(
              StringConstants.readyWeSendYour,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 16.px),
            ),
            SizedBox(height: 20.px),
            Text(
              'motasistem@gmail.com',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.px,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(height: 40.px),
            Text(
              StringConstants.theInvitationIsValidUntilSunday,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 16.px),
            ),
            SizedBox(height: 20.px),
            CommonWidgets.commonElevatedButton(
              onPressed: () =>
                  controller.clickOnCreateAnotherInvitationButton(),
              childText: Text(
                StringConstants.createAnotherInvitation,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.px),
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnSeeYourCollaboratorsButton(),
              buttonColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.6.px),
              childText: Text(
                StringConstants.seeYourCollaborators,
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
    );
  }
}
