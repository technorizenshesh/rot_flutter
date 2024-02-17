import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/linked_devices_controller.dart';

class LinkedDevicesView extends GetView<LinkedDevicesController> {
  const LinkedDevicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.linkedDevices),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  Text(
                    "There are 3 devices that accessed your account in the last 6 months. If you don't recognize a device, we recommend unlinking it to keep your account secure.",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12.px,
                        ),
                  ),
                  SizedBox(height: 20.px),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 60.px,
                            width: 60.px,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondary
                                    .withOpacity(.2.px),
                                borderRadius: BorderRadius.circular(14.px)),
                            child: Center(
                              child: CommonWidgets.appIcons(
                                assetName: IconConstants.icPhone,
                                height: 30.px,
                                width: 30.px,
                                borderRadius: 0.px,
                              ),
                            ),
                          ),
                          title: Text(
                            'iPhone (iPhone SE 2nd Gen)',
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 18.px),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mercado Libre App',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                                maxLines: 1,
                              ),
                              SizedBox(height: 2.px),
                              Text(
                                '14 days ago',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                    ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          trailing: Text(
                            'Unlink',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                        SizedBox(height: 10.px),
                        Divider(
                          height: 2.px,
                          color: Theme.of(context).colorScheme.onSecondary,
                          thickness: .2.px,
                        ),
                        SizedBox(height: 10.px),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),);
  }
}
