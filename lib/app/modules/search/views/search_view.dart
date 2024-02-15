import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot/app/data/constants/icons_constant.dart';
import 'package:rot/app/data/constants/string_constants.dart';
import 'package:rot/app/modules/search/controllers/search_controller.dart';
import 'package:rot/common/common_widgets.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.search),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.px),
            CommonWidgets.commonTextField(
              hintText: StringConstants.search,
              borderRadius: 24.px,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.appIcons(
                    assetName: IconConstants.icSearch,
                    height: 20.px,
                    width: 20.px,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.px),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) => Card(
                  elevation: .2.px,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CommonWidgets.appIcons(
                      assetName: IconConstants.icUserImage,
                      height: 60.px,
                      width: 60.px,
                      borderRadius: 0.px,
                    ),
                    title: Text(
                      'iphone',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 20.px),
                    ),
                    subtitle: Text(
                      'Cell Phones & Accessories',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 14.px,
                          ),
                    ),
                    trailing: CommonWidgets.appIcons(
                      assetName: IconConstants.icLikePrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
