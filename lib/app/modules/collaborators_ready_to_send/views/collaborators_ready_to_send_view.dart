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
      appBar: CommonWidgets.appBar(title: StringConstants.collaborators.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
              StringConstants.readyWeSendYour.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 16.px),
            ),
            SizedBox(height: 20.px),
            Text(
              controller.collaboratorUser.email ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.px,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(height: 15.px),
            GestureDetector(
              onTap: () {
                controller.showBottomSheet();
              },
              child: Container(
                  height: 35.px,
                  //  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.px),
                      color: Colors.teal),
                  child: Text(
                    StringConstants.viewRolePermission.tr,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            ),
            SizedBox(height: 10.px),
            SizedBox(height: 10.px),
            controller.collaboratorUser.status == 'approve'
                ? Text(
                    'User already accepted your invitation...',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 12.px),
                  )
                : Text(
                    'The invitation is valid until ${controller.collaboratorUser.inviteDate}. Once you accept it, you can start collaborating on your account.',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
            SizedBox(height: 20.px),
            const Spacer(),
            CommonWidgets.commonElevatedButton(
              onPressed: () =>
                  controller.clickOnCreateAnotherInvitationButton(),
              childText: Text(
                StringConstants.createAnotherInvitation.tr,
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
                StringConstants.seeYourCollaborators.tr,
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

  int timeDifferent(String givenTime) {
    final DateTime givenDateTime = DateTime.parse(givenTime);
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(givenDateTime);
    final int daysDifference = difference.inDays;

    return daysDifference;
  }
}
