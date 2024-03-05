import 'package:get/get.dart';
import 'package:rot_application/app/data/apis/api_models/get_hash_tag_model.dart';

import '../../../data/apis/api_methods/api_methods.dart';

class HashtagController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  List<Data> data = [];
  List selectedListValue = [];
  List selectedListValueTitle = [];

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
    await getHashTagApi();
  }

  Future<void> getHashTagApi() async {
    GetHashTagModel? getHashTagModel = await ApiMethods.getHashTag();
    if (getHashTagModel != null &&
        getHashTagModel.data != null &&
        getHashTagModel.data!.isNotEmpty) {
      data = getHashTagModel.data ?? [];
    }
  }
}
