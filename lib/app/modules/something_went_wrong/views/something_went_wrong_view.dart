import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/something_went_wrong_controller.dart';

class SomethingWentWrongView extends GetView<SomethingWentWrongController> {
  const SomethingWentWrongView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.px),
              child: Column(
                children: [
                  SizedBox(height: 60.px),
                  CommonWidgets.appIcons(
                    assetName: ImageConstants.imageSomethingWentWrong,
                    height: 320.px,
                    width: 320.px,
                  ),
                  SizedBox(height: 30.px),
                  Text(
                    StringConstants.somethingWentWrong,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 18.px),
                  ),
                  SizedBox(height: 10.px),
                  Text(
                    StringConstants.weAreWorkingToSolveIt,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.px),
                  Text(
                    StringConstants.ifTheProblemPersists,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.px),
                  Text(
                    "${StringConstants.code} DFW07-UZWZHAXPMFQZ",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.px),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      StringConstants.retry,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 18.px,
                                color: Theme.of(context).primaryColor,
                              ),
                    ),
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
          ],
        ));
  }
}
