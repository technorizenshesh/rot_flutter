import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rot_application/common/progress_bar.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchViewController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBar(title: StringConstants.search.tr),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                CommonWidgets.commonTextField(
                  // readOnly: true,
                  // onTap: () => controller.clickOnSearchTextField(),
                  onChanged: (value) => controller.searchMethod(value: value),
                  controller: controller.searchController,
                  hintText: StringConstants.search.tr,
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
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonWidgets.appIcons(
                        assetName: IconConstants.icCameraNavBar,
                        height: 40.px,
                        width: 40.px,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.px),
                if (controller.allProductData.isNotEmpty)
                  controller.searchResult.isNotEmpty ||
                          controller.searchController.text.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: controller.searchResult.length,
                            itemBuilder: (context, index) => Card(
                              elevation: .2.px,
                              child: ListTile(
                                onTap: () {
                                  controller.openProductDetailPage(
                                      productId:
                                          controller.searchResult[index].id!,
                                      otherUserId: controller
                                          .searchResult[index].userId!);
                                },
                                contentPadding: EdgeInsets.zero,
                                leading: CommonWidgets.imageView(
                                  image: controller.searchResult[index].image ??
                                      '',
                                  height: 60.px,
                                  width: 60.px,
                                  radius: 5.px,
                                ),
                                title: Text(
                                  controller.searchResult[index].title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 20.px),
                                ),
                                subtitle: Text(
                                  controller.searchResult[index].description ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                                trailing: CommonWidgets.appIcons(
                                  assetName: IconConstants.icLikePrimary,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: controller.allProductData.length,
                            itemBuilder: (context, index) => Card(
                              elevation: .2.px,
                              child: ListTile(
                                  onTap: () {
                                    controller.openProductDetailPage(
                                        productId: controller
                                            .allProductData[index].id!,
                                        otherUserId: controller
                                            .allProductData[index].userId!);
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  leading: CommonWidgets.imageView(
                                    image: controller
                                            .allProductData[index].image ??
                                        '',
                                    height: 60.px,
                                    width: 60.px,
                                    radius: 5.px,
                                  ),
                                  title: Text(
                                    controller.allProductData[index].title ??
                                        '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 18.px),
                                  ),
                                  subtitle: Text(
                                    controller.allProductData[index]
                                            .description ??
                                        '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      controller.productLikeUnlikeApi(
                                          controller.allProductData[index].id!);
                                    },
                                    child: Obx(() {
                                      controller.likeProductId.value;
                                      return controller.likeProductId.value ==
                                              controller
                                                  .allProductData[index].id
                                          ? Icon(
                                              Icons.favorite_rounded,
                                              size: 24,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )
                                          : Icon(
                                              Icons.favorite_border,
                                              size: 24,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            );
                                    }),
                                  )),
                            ),
                          ),
                        ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
