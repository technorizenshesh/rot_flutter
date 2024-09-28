import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_notification_setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class NotificationController extends GetxController {
  final count = 0.obs;

  final expiredSwitchValue = false.obs;
  final searchSwitchValue = false.obs;
  final priceSwitchValue = false.obs;
  final favoritesSoldSwitchValue = false.obs;
  final favoritesReservedSwitchValue = false.obs;
  final newProductSwitchValue = false.obs;
  final tripSwitchValue = false.obs;
  final promotionSwitchValue = false.obs;
  final btnLoading = false.obs;
  String userId = '';
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    getNotificationSettingApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> saveNotificationSettingApi() async {
    try {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userId: userId,
        'expired_product': expiredSwitchValue.value ? 'Yes' : 'No',
        'search_alerts': searchSwitchValue.value ? 'Yes' : 'No',
        'price_drop': priceSwitchValue.value ? 'Yes' : 'No',
        'favorites_sold': favoritesSoldSwitchValue.value ? 'Yes' : 'No',
        'favorites_reserved': favoritesReservedSwitchValue.value ? 'Yes' : 'No',
        'new_products': newProductSwitchValue.value ? 'Yes' : 'No',
        'trip_suggestion': tripSwitchValue.value ? 'Yes' : 'No',
        'promotion': promotionSwitchValue.value ? 'Yes' : 'No',
      };

      btnLoading.value = true;
      NotificationSettingModel? settingModel =
          await ApiMethods.saveNotificationSettingApi(bodyParams: bodyParams);
      if (settingModel != null && settingModel.status == "1") {
        CommonWidgets.showMyToastMessage(settingModel.message ?? '');
      } else {
        CommonWidgets.showMyToastMessage(settingModel!.message ?? '');
      }
      btnLoading.value = false;
    } catch (e) {
      btnLoading.value = false;
    }
  }

  Future<void> getNotificationSettingApi() async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: userId,
    };
    NotificationSettingModel? settingModel =
        await ApiMethods.getNotificationSettingApi(bodyParams: bodyParams);
    if (settingModel != null && settingModel.status == "1") {
      expiredSwitchValue.value =
          settingModel.data!.expiredProduct == 'Yes' ? true : false;
      searchSwitchValue.value =
          settingModel.data!.searchAlerts == 'Yes' ? true : false;
      priceSwitchValue.value =
          settingModel.data!.priceDrop == 'Yes' ? true : false;
      favoritesSoldSwitchValue.value =
          settingModel.data!.favoritesSold == 'Yes' ? true : false;
      favoritesReservedSwitchValue.value =
          settingModel.data!.favoritesReserved == 'Yes' ? true : false;
      newProductSwitchValue.value =
          settingModel.data!.newProducts == 'Yes' ? true : false;
      tripSwitchValue.value =
          settingModel.data!.promotion == 'Yes' ? true : false;
      promotionSwitchValue.value =
          settingModel.data!.promotion == 'Yes' ? true : false;
      increment();
    } else {
      CommonWidgets.showMyToastMessage(settingModel!.message ?? '');
    }
  }
}
