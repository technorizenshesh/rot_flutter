import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_subscription_model.dart';

import '../../../data/apis/api_methods/api_methods.dart';

class SubscriptionController extends GetxController {
  //TODO: Implement SubscriptionController
  List<GetSubscriptionData> subscriptionList = [];
  final dataPresent = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
}
