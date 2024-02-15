import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/common/common_widgets.dart';
import '../controllers/add_new_account_controller.dart';

class AddNewAccountView extends GetView<AddNewAccountController> {
  const AddNewAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.addNewAccount),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          children: [
            SizedBox(height: 20.px),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.list.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CommonWidgets.appIcons(
                        assetName: controller.list[index]['icon'],
                        height: 40.px,
                        width: 40.px,
                        borderRadius: 20.px,
                      ),
                      title: Text(
                        controller.list[index]['title'],
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      subtitle: Text(
                        controller.list[index]['subtitle'],
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 12.px),
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
