import 'package:country_flags/country_flags.dart';
import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
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
            buttonMargin:
                const EdgeInsets.only(bottom: 10, right: 10, left: 10)),
        body: Obx(() {
          controller.count.value;
          return Padding(
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
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: ListTile(
                          onTap: () {
                            controller.showMyCurrencyPicker();
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(25.px),
                            child: CountryFlag.fromCountryCode(
                              controller.getCountryCode(),
                              height: 50.px,
                              width: 50.px,
                              borderRadius: 3,
                            ),
                          ),
                          title: Text(
                            controller.convertorCountryName.value,
                            style: MTextThemeStyle.titleMedium()
                                .copyWith(color: Colors.teal),
                          ),
                          subtitle: Text(
                            controller.convertorCurrency.value,
                            style: MTextThemeStyle.titleMedium()
                                .copyWith(color: Colors.black87),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20.px,
                            color: Colors.teal,
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: CommonWidgets.commonTextField(
                            controller: controller.convertorController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.convertorController.text = value;
                                controller.increment();
                              }
                            }))
                  ],
                ),
                SizedBox(height: 5.px),
                if (controller.dataPresent.value)
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
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              controller.flagIconList.removeAt(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('$item dismissed')));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: CommonWidgets.appIcons(
                                        assetName:
                                            controller.flagIconList[index],
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
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    subtitle: Text(
                                      controller.subTitleList[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 16.px,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                          '${cSymbol(controller.subTitleList[index])} ${controller.getCurrentValue(controller.subTitleList[index])}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 16.px,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '1 ${controller.convertorCurrency} = ${controller.getConversationRate(controller.subTitleList[index])} ${controller.subTitleList[index]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  fontSize: 12.px,
                                                  fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),
                SizedBox(
                  height: 20.px,
                ),
                if (!controller.dataPresent.value)
                  Text(
                    'This country money convertor rate are not available.',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 16.px, color: Colors.redAccent),
                  ),
              ],
            ),
          );
        }));
  }
}
