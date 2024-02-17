import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.notification),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                title(title: StringConstants.contactInfo),
                SizedBox(height: 10.px),
                subTitle(
                    subTitle:
                        StringConstants.getNotifiedIfAnyOfYourProductsExpire),
                SizedBox(height: 10.px),
                tile(title: StringConstants.expiredProducts),
                SizedBox(height: 20.px),
                title(title: StringConstants.mySearches),
                SizedBox(height: 10.px),
                subTitle(
                    subTitle: StringConstants.getNotifiedWhenNewProductsFit),
                SizedBox(height: 10.px),
                tile(title: StringConstants.searchAlerts),
                SizedBox(height: 20.px),
                title(title: StringConstants.myFavorites),
                SizedBox(height: 10.px),
                subTitle(
                    subTitle: StringConstants.getNotifiedAboutAnyNewsRegarding),
                SizedBox(height: 10.px),
                tile(title: StringConstants.priceDrop),
                tile(title: StringConstants.favoritesSold),
                tile(title: StringConstants.favoritesReserved),
                tile(title: StringConstants.newProducts),
                title(title: StringConstants.additionalOptions),
                SizedBox(height: 10.px),
                subTitle(
                    subTitle:
                        StringConstants.getNotifiedAboutPromotionsAndOther),
                SizedBox(height: 10.px),
                tile(title: StringConstants.tipsTndSuggestions),
                tile(title: StringConstants.promotionsAndNewFeatures),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget title({required String title}) {
    return Text(
      title,
      style: Theme.of(Get.context!)
          .textTheme
          .displayMedium
          ?.copyWith(fontSize: 18.px),
    );
  }

  Widget subTitle({required String subTitle}) {
    return Text(
      subTitle,
      style: Theme.of(Get.context!).textTheme.titleMedium,
    );
  }

  Widget tile({required String title, ValueChanged<bool>? onChanged}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: CupertinoSwitch(
        value: controller.switchValue.value,
        activeColor: Theme.of(Get.context!).primaryColor,
        onChanged: onChanged,
      ),
      title: Text(
        title,
        style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
            fontSize: 14.px, color: Theme.of(Get.context!).primaryColor),
      ),
    );
  }
}
