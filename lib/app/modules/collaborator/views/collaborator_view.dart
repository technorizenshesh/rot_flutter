import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_collaborators_invited_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/collaborator_controller.dart';

class CollaboratorView extends GetView<CollaboratorController> {
  const CollaboratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.collaborators.tr),
      bottomNavigationBar: Container(
        height: 150.px,
        padding: EdgeInsets.all(5.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnInviteCollaboratorButton(),
              childText: Text(
                StringConstants.inviteCollaborator.tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.px),
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnManageRolesButton(),
              buttonColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.6.px),
              childText: Text(
                StringConstants.manageRoles.tr,
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
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: ListView(
            children: [
              SizedBox(height: 20.px),
              CommonWidgets.commonTextField(
                  hintText: StringConstants.searchForCollaborator.tr,
                  controller: controller.searchController,
                  borderRadius: 24.px,
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonWidgets.appIcons(
                        assetName: IconConstants.icSearch,
                        height: 20.px,
                        width: 20.px,
                      ),
                    ],
                  ),
                  onChanged: (text) {
                    controller.searchMethod(value: text);
                  }),
              SizedBox(height: 20.px),
              controller.showLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.filterInvitedUserList.length,
                      itemBuilder: (context, index) {
                        CollaboratorsInvitedData item =
                            controller.filterInvitedUserList[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            item.email ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 18.px),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.px),
                              Text(
                                item.status == 'approve'
                                    ? 'Approve'
                                    : '1 Pending invitation: expires in ${item.inviteDate}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontSize: 12.px),
                              ),
                              SizedBox(height: 10.px),
                              Text(
                                item.role ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.px),
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            offset: Offset(-34.px, 20.px),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.px)),
                            elevation: .4.px,
                            icon: Icon(
                              Icons.more_vert,
                              color: Theme.of(context).primaryColor,
                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: StringConstants.seeDetails.tr,
                                  child: Text(
                                    StringConstants.seeDetails.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: StringConstants.resendInvitation.tr,
                                  child: Text(
                                    StringConstants.resendInvitation.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: StringConstants.eliminate.tr,
                                  child: Text(
                                    StringConstants.eliminate.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                ),
                              ];
                            },
                            onSelected: (String value) =>
                                actionPopUpItemSelected(value, 'mah', item),
                          ),
                        );
                      },
                    ),
              if (!controller.showLoading.value &&
                  controller.invitedUserList.isEmpty)
                CommonWidgets.dataNotFound(),
              SizedBox(height: 20.px),
            ],
          ),
        );
      }),
    );
  }

  void actionPopUpItemSelected(
      String value, String name, CollaboratorsInvitedData collaboratorUser) {
    String message = '';
    if (value == StringConstants.seeDetails.tr) {
      message = 'You selected edit for $name';
      Get.toNamed(Routes.COLLABORATORS_READY_TO_SEND,
          arguments: collaboratorUser);
    } else if (value == StringConstants.resendInvitation.tr) {
      message = 'You selected delete for $name';
      controller.resendInviteApi(collaboratorUser.id ?? '');
    } else {
      if (value == StringConstants.eliminate.tr) {
        message = StringConstants.eliminate.tr;
        controller.deleteInviteApi(collaboratorUser.id ?? '');
      }
    }
    print(message);
  }

  int timeDifferent(String givenTime) {
    final DateTime givenDateTime = DateTime.parse(givenTime);
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(givenDateTime);
    final int daysDifference = difference.inDays;
    return daysDifference;
  }
}
