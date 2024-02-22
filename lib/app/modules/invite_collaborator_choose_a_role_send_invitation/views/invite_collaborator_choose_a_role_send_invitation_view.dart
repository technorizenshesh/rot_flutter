import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/invite_collaborator_choose_a_role_send_invitation_controller.dart';

class InviteCollaboratorChooseARoleSendInvitationView
    extends GetView<InviteCollaboratorChooseARoleSendInvitationController> {
  const InviteCollaboratorChooseARoleSendInvitationView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.inviteCollaborator),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.px),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.px,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.email,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                      SizedBox(height: 8.px),
                      Text(
                        'dwaynejohnson@gmail.com',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 14.px),
                      ),
                      SizedBox(height: 20.px),
                      GestureDetector(
                        onTap: () => controller.clickOnChangeEmail(),
                        child: Text(
                          StringConstants.changeEmail,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.px),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.px),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2.px,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.assignedRole,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                      SizedBox(height: 8.px),
                      Text(
                        'Administrator | 6 Permissions',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 14.px),
                      ),
                      SizedBox(height: 20.px),
                      GestureDetector(
                        onTap: () => controller.clickOnChangeRole(),
                        child: Text(
                          StringConstants.changeRole,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        // Handle the checkbox toggle
                        controller.isChecked.value =
                            !controller.isChecked.value;
                        controller.increment();
                      },
                      child: Container(
                        height: 20.px,
                        width: 20.px,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2.px, // Border width
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: controller.isChecked.value
                            ? Center(
                                child: Icon(
                                  Icons.check_rounded,
                                  size: 16.px,
                                  color: Theme.of(context)
                                      .primaryColor, // Color of the check icon when selected
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.px),
                  Flexible(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: StringConstants.iAcceptThe,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 12.px),
                        ),
                        TextSpan(
                          text: StringConstants.termsAndConditions,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 12.px,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        TextSpan(
                          text: StringConstants.forTheUseOfTheCollaboratorsTool,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 12.px),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnSendInvitationButton(),
                childText: Text(
                  StringConstants.sendInvitation,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnCancelButton(),
                buttonColor: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(.6.px),
                childText: Text(
                  StringConstants.cancel,
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
    });
  }
}
