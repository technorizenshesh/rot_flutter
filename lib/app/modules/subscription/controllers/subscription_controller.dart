import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_constants/api_key_constants.dart';
import 'package:rot_application/app/data/apis/api_models/get_my_purchase_subscription_model.dart';
import 'package:rot_application/app/data/apis/api_models/get_subscription_model.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class SubscriptionController extends GetxController {
  //TODO: Implement SubscriptionController
  List<GetSubscriptionData> subscriptionList = [];
  List<MyPurchaseSubscriptionData> myPurchaseSubscriptionData = [];
  final dataPresent = false.obs;
  final mySubscriptionPresent = false.obs;
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  @override
  void onInit() async {
    super.onInit();
    await getMyPurchasedSubscription();
    getSubscriptionApi();
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

  Future<void> getMyPurchasedSubscription() async {
    Map<String, dynamic> paramsQuery = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]
    };
    MyPurchaseSubscriptionModel? myPurchaseSubscriptionModel =
        await ApiMethods.getMyPurchasedSubscriptionApi(
            queryParameters: paramsQuery);
    if (myPurchaseSubscriptionModel != null &&
        myPurchaseSubscriptionModel.data != null &&
        myPurchaseSubscriptionModel.data!.isNotEmpty) {
      myPurchaseSubscriptionData = myPurchaseSubscriptionModel.data!;
      mySubscriptionPresent.value = true;
    } else {
      mySubscriptionPresent.value = false;
    }
  }

  Future<void> getSubscriptionApi() async {
    GetSubscriptionModel? getSubscriptionModel =
        await ApiMethods.getSubscriptionApi();
    if (getSubscriptionModel != null &&
        getSubscriptionModel.data != null &&
        getSubscriptionModel.data!.isNotEmpty) {
      subscriptionList = getSubscriptionModel.data!;
      dataPresent.value = true;
    }
  }

  onClickOnSubscription(int index) {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
    };
    Get.toNamed(Routes.PURCHASE_SUBSCRIPTION,
        parameters: data, arguments: subscriptionList[index]);
  }

  bool checkSubscriptionPurchased(index) {
    for (int i = 0; i < myPurchaseSubscriptionData.length; i++) {
      if (myPurchaseSubscriptionData[i].subscriptionId ==
          subscriptionList[index].id) {
        return true;
      }
    }
    return false;
  }
}
