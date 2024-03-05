import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_product_status_model.dart';

class ProductsStatusController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  List<Data> data = [];
  GetProductStatusModel? getProductStatusModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
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

  Future<void> onInitWork() async {
    await getProductStatusApi();
  }

  Future<void> getProductStatusApi() async {
    getProductStatusModel = await ApiMethods.getProductStatus();
    if (getProductStatusModel != null &&
        getProductStatusModel!.data != null &&
        getProductStatusModel!.data!.isNotEmpty) {
      data = getProductStatusModel!.data ?? [];
    }
  }
}
