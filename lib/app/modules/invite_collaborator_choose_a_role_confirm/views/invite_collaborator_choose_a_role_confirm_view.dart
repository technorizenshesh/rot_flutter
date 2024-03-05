import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/invite_collaborator_choose_a_role_confirm_controller.dart';

class InviteCollaboratorChooseARoleConfirmView
    extends GetView<InviteCollaboratorChooseARoleConfirmController> {
  const InviteCollaboratorChooseARoleConfirmView({Key? key}) : super(key: key);

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Administrator | 6 Permissions',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                          GestureDetector(
                            onTap: () => controller.clickOnIcon(),
                            child: Icon(
                              controller.upValue.value
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      if (controller.upValue.value) SizedBox(height: 10.px),
                      if (controller.upValue.value)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exclusive permissions from ROT Libre',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 10.px),
                            Text(
                              'Publish in ROT Libre and ROT Shops',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 10.px),
                            Text(
                              'Manage my sales',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 10.px),
                            Text(
                              'Answer questions',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 10.px),
                            Text(
                              'Rate users',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 10.px),
                            Text(
                              'Manage payments and invoices',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 10.px),
                            Text(
                              'Exclusive ROT permissions',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 10.px),
                            Text(
                              'View account balance',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnConfirmButton(),
                childText: Text(
                  StringConstants.confirm,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnGoBackButton(),
                buttonColor: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(.6.px),
                childText: Text(
                  StringConstants.goBack,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10.px),
              TextButton(
                onPressed: () {},
                child: Text(
                  StringConstants.editRolePermissions,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 18.px,
                        color: Theme.of(context).primaryColor,
                      ),
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
