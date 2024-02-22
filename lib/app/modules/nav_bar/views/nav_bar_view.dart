import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: controller.body(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.px, vertical: 8.px),
                      child: GNav(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.px, vertical: 4.px),
                        tabs: [
                          button(
                              image: IconConstants.icHome,
                              text: StringConstants.home.tr,
                              index: 0),
                          button(
                              image: IconConstants.icFavorites,
                              text: StringConstants.favorites.tr,
                              index: 1),
                          button(
                              image: IconConstants.icChat, text: '', index: 2),
                          button(
                              image: IconConstants.icChat,
                              text: StringConstants.chatNow.tr,
                              index: 3),
                          button(
                              image: IconConstants.icProfile,
                              text: StringConstants.profile.tr,
                              index: 4),
                        ],
                        selectedIndex: selectedIndex.value,
                        onTabChange: (index) {
                          selectedIndex.value = index;
                          controller.increment();
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedIndex.value = 2;
                      controller.increment();
                    },
                    child: CommonWidgets.appIcons(
                      width: 84.px,
                      height: 84.px,
                      assetName: IconConstants.icCameraNavBar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  button({required String image, required String text, required int index}) {
    return GButton(
      icon: Icons.add,
      leading: Column(
        children: [
          CommonWidgets.appIcons(
            assetName: image,
            color: selectedIndex.value == index
                ? Theme.of(Get.context!).primaryColor
                : Theme.of(Get.context!)
                    .textTheme
                    .headlineMedium
                    ?.color
                    ?.withOpacity(.6),
          ),
          Text(
            text,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  fontSize: 12.px,
                  color: selectedIndex.value == index
                      ? Theme.of(Get.context!).primaryColor
                      : Theme.of(Get.context!)
                          .textTheme
                          .headlineMedium
                          ?.color
                          ?.withOpacity(.6),
                ),
          ),
        ],
      ),
    );
  }
}
