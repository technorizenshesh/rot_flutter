import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/apis/api_models/get_collaborators_invited_model.dart';
import '../../../routes/app_pages.dart';

class CollaboratorsReadyToSendController extends GetxController {
  final count = 0.obs;

  CollaboratorsInvitedData collaboratorUser = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnSeeYourCollaboratorsButton() {
    Get.back();
  }

  clickOnCreateAnotherInvitationButton() {
    Get.toNamed(Routes.INVITE_COLLABORATOR);
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: Get.context!,
      constraints: BoxConstraints(maxHeight: 600.px, minHeight: 300.px),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 15.px, right: 15.px, top: 20.px, bottom: 5.px),
                child: Text(
                  collaboratorUser.role ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.teal),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: collaboratorUser.collaboratorsPermission!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(10.px),
                  itemBuilder: (context, index) {
                    return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          collaboratorUser
                                  .collaboratorsPermission![index].permission ??
                              '',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black87),
                        ),
                        leading: Checkbox(
                          value: true,
                          activeColor: Colors.teal,
                          checkColor: Colors.white,
                          side: BorderSide(
                            color: Colors.teal,
                            width: 1.px,
                          ),
                          onChanged: (value) {},
                        ));
                  },
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
