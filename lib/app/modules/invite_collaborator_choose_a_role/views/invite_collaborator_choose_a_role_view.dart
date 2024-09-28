import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/invite_collaborator_choose_a_role_controller.dart';

class InviteCollaboratorChooseARoleView
    extends GetView<InviteCollaboratorChooseARoleController> {
  const InviteCollaboratorChooseARoleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.inviteCollaborator),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.px),
            Text(
              StringConstants.chooseARole,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20.px,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(height: 40.px),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                controller.role.value = 'Administrator';
                controller.clickOnCreateNewRoleButton();
              },
              title: Text(
                'Administrator',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 18.px),
              ),
              trailing: Image.asset(
                IconConstants.icRightArrow,
                height: 24.px,
                width: 24.px,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.px),
            Divider(
              height: 2.px,
              color: Theme.of(context).colorScheme.onSecondary,
              thickness: .2.px,
            ),
            ListTile(
              onTap: () {
                controller.role.value = 'Supervisor';
                controller.clickOnCreateNewRoleButton();
              },
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Supervisor',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 18.px),
              ),
              trailing: Image.asset(
                IconConstants.icRightArrow,
                height: 24.px,
                width: 24.px,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.px),
            Divider(
              height: 2.px,
              color: Theme.of(context).colorScheme.onSecondary,
              thickness: .2.px,
            ),
            /*  SizedBox(height: 20.px),
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnCreateNewRoleButton(),
              childText: Text(
                StringConstants.createNewRole,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),*/
            SizedBox(height: 20.px),
            const Spacer(),
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnGoBackButton(),
              buttonColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.6.px),
              childText: Text(
                StringConstants.goBack,
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
