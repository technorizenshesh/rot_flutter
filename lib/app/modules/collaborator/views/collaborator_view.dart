import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: ListView(
          children: [
            SizedBox(height: 20.px),
            CommonWidgets.commonTextField(
              hintText: StringConstants.searchForCollaborator.tr,
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
            ),
            SizedBox(height: 20.px),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'motasistem@gmail.com',
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
                        '1 Pending invitation: expires in 7 days',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 12.px),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        'Administrator',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 14.px),
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
                        actionPopUpItemSelected(value, 'mah'),
                  ),
                );
              },
            ),
            SizedBox(height: 20.px),
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
    );
  }

  void actionPopUpItemSelected(String value, String name) {
    String message;
    if (value == 'edit') {
      message = 'You selected edit for $name';
      // You can navigate the user to edit page.
    } else if (value == 'delete') {
      message = 'You selected delete for $name';
      // You can delete the item.
    } else {
      message = 'Not implemented';
      Get.toNamed(Routes.SOMETHING_WENT_WRONG);
    }
    print(message);
  }
}
