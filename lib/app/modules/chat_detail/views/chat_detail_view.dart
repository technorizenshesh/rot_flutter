import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/chat_detail_controller.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  const ChatDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 60.px),
        Card(
          elevation: .2.px,
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px)),
            leading: CommonWidgets.appIcons(
              assetName: IconConstants.icBack,
              height: 34.px,
              width: 34.px,
              borderRadius: 0.px,
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonWidgets.appIcons(
                  assetName: IconConstants.icUserImage,
                  height: 40.px,
                  width: 40.px,
                  borderRadius: 20.px,
                ),
                SizedBox(width: 8.px),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${CommonMethods.cur} 25.00',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 20.px),
                      ),
                      Text(
                        'Nemo enim ipsam voluptatem quia voluptas sit aspernatur',
                        maxLines: 2,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.more_vert_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 20.px),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.px),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2.px,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.px),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              CommonWidgets.appIcons(
                                assetName: IconConstants.icGetPaidInPerson,
                                height: 16.px,
                                width: 16.px,
                                borderRadius: 0.px,
                              ),
                              SizedBox(width: 10.px),
                              Text(
                                StringConstants.getPaid.tr,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 14.px),
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(width: 10.px),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2.px,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.px),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              CommonWidgets.appIcons(
                                assetName: IconConstants.icEditPrice,
                                height: 16.px,
                                width: 16.px,
                                borderRadius: 0.px,
                              ),
                              SizedBox(width: 10.px),
                              Text(
                                StringConstants.editPrice.tr,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 14.px),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.px),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.px),
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.1.px),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.px),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icSecurityReasons,
                            height: 16.px,
                            width: 16.px,
                            borderRadius: 0.px,
                          ),
                          SizedBox(width: 14.px),
                          Text(
                            StringConstants.forSecurity.tr,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.color),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.8.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.px),
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.1.px),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.px),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet consectetur. Nibh id nunc vitae mauris sem odio. Urna varius ut.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.color),
                                ),
                                SizedBox(height: 10.px),
                                Text(
                                  '08:21',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.color),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.8.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.px),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.px),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.color),
                                ),
                                SizedBox(height: 10.px),
                                Text(
                                  '08:21',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.color),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.8.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.px),
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.1.px),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.px),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.color),
                                ),
                                SizedBox(height: 10.px),
                                CommonWidgets.commonElevatedButton(
                                  wantContentSizeButton: true,
                                  decoration: const BoxDecoration(),
                                  onPressed: () =>
                                      controller.clickOnViewButton(),
                                  borderRadius: 12.px,
                                  contentPadding: EdgeInsets.zero,
                                  height: 24.px,
                                  childText: Text(
                                    'View',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.px,
                                        ),
                                  ),
                                ),
                                SizedBox(height: 10.px),
                                Text(
                                  '08:21',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.color),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.px),
        Padding(
          padding: EdgeInsets.all(16.px),
          child: TextField(
            maxLines: 1,
            style: Theme.of(Get.context!)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: 14.px),
            decoration: InputDecoration(
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.px, vertical: 2.px),
                      child: CommonWidgets.appIcons(
                        assetName: IconConstants.icSend,
                        height: 50.px,
                        width: 50.px,
                        borderRadius: 0.px,
                      ),
                    ),
                  ),
                ],
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.px, vertical: 2.px),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.attach_file_rounded,
                          color:
                              Theme.of(context).textTheme.displayMedium?.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              fillColor:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.1.px),
              filled: true,
              disabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.px),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.px),
                  borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.px),
                  borderSide: BorderSide.none),
              hintText: StringConstants.typeHere.tr,
              hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
            ),
          ),
        ),
      ]),
    );
  }
}
