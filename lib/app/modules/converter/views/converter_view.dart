import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/converter_controller.dart';

class ConverterView extends GetView<ConverterController> {
  const ConverterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.converter.tr),
      bottomNavigationBar: CommonWidgets.commonElevatedButton(
          onPressed: () => controller.clickOnSave(),
          childText: Text(
            StringConstants.addNew,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          buttonMargin: const EdgeInsets.only(bottom: 10, right: 10, left: 10)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.px),
            Text(
              'Converter',
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 24.px),
            ),
            SizedBox(height: 8.px),
            Text(
              'Use the converter to compare current values',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 14.px,
                  ),
              maxLines: 1,
            ),
            SizedBox(height: 20.px),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.flagIconList.length,
                  itemBuilder: (context, index) {
                    String item = controller.flagIconList[index];
                    return Dismissible(
                      key: Key(item),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 15),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              "Borrar",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        controller.flagIconList.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$item dismissed')));
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CommonWidgets.appIcons(
                            assetName: controller.flagIconList[index],
                            height: 50.px,
                            width: 50.px,
                            borderRadius: 25.px,
                            fit: BoxFit.fill),
                        title: Text(
                          controller.titleList[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 16.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                        subtitle: Text(
                          controller.subTitleList[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 16.px, fontWeight: FontWeight.w400),
                        ),
                        trailing: Text(
                          controller.amountList[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 16.px, fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
