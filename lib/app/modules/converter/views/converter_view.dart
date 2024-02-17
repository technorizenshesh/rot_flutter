import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/app/data/constants/image_constants.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/converter_controller.dart';

class ConverterView extends GetView<ConverterController> {
  const ConverterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.converter),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.px),
            Text(
              'Do you have a low balance?',
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 18.px),
            ),
            SizedBox(height: 8.px),
            Text(
              'Make a mixed payment and complete the payment with your card or PayPal.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 12.px,
                  ),
              maxLines: 1,
            ),
            SizedBox(height: 20.px),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 1,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CommonWidgets.appIcons(
                        assetName: ImageConstants.imageLogo,
                        height: 40.px,
                        width: 40.px,
                        borderRadius: 20.px,
                      ),
                      title: Text(
                        'Bitcoin',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      subtitle: Text(
                        'BTC',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px, fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        '100',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 4.px),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
